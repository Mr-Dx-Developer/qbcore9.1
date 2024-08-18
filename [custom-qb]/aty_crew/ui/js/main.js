var locales = {}
var memberRanks = []
var inviteData = {}

var playerId = 0
var playerData = {}

var crewList = []
var playerCrew = {}
var closestPlayers = []

$(function () {
	function closePage() {
		$("body").hide()

		closeMenus()
		closeLists()

		$.post(`https://${GetParentResourceName()}/close`)
	}

	function closeMenus() {
		$(".create-crew").fadeOut(100)
		$(".invite-menu").fadeOut(100)
		$(".leave-crew").fadeOut(100)
		$(".delete-crew").fadeOut(100)
		$(".sec-bg").fadeOut(100)
	}

	function closeLists() {
		$(".bottom").show()
		$(".close-btn").show()
		$(".crew-members").hide()
		$(".crew-list").hide()
		$(".back-btn").hide()
	}

	var notifyCount = 0

	function notify(type, message) {
		const notifyId = ++notifyCount

		$(".notify").append(`
					<div class="wrapper ${type}" data-notifyId="${notifyId}">
						<div class="title"><i class="${
							type == "error"
								? "fa-solid fa-triangle-exclamation"
								: type == "success"
								? "fa-solid fa-check"
								: "fa-solid fa-circle-info"
						}"></i> ${type.toUpperCase()}</div>
						<div class="content">${message}</div>
					</div>
				`)

		setTimeout(
			() =>
				$(`div[data-notifyId="${notifyId}"`).fadeOut(1000, function () {
					$(this).remove()
				}),
			5000
		)
	}

	function calculateTotalKD(crew) {
		let kills = 0
		let deaths = 0

		crew.members.forEach((member) => {
			kills += member.kills
			deaths += member.deaths
		})

		return {
			kills,
			deaths,
		}
	}

	function getRankNumber(crewId) {
		let no = crewList.length + 1

		crewList
			.sort((a, b) => calculateTotalKD(b).kills - calculateTotalKD(a).kills)
			.forEach((crew, i) => {
				if (crew.id == crewId) {
					no = i + 1
				}
			})

		return no
	}

	function hasPermission(target, permission) {
		if (!isObjectEmpty(playerCrew) && !isObjectEmpty(playerData) && target.token != playerData.token) {
			if (playerCrew.leader == playerData.token) return true

			return (
				memberRanks[playerData.rank - 1].permissions &&
				memberRanks[playerData.rank - 1].permissions.includes(permission) &&
				playerCrew.leader != target.token &&
				target.rank < playerData.rank
			)
		}

		return false
	}

	function openInviteMenu() {
		$(".notify").hide()
		$(".top").hide()
		$(".bottom").hide()
		$(".overlay").hide()
		$(".bg").hide()
		$(".close-btn").fadeOut(100)

		const locale = $(".invite-crew .title").data("locale")

		$(".invite-crew .title").text(
			(locales[locale] || "Unknown Locale")
				.replace("{crew}", inviteData.crewName)
				.replace("{player}", inviteData.senderName)
		)

		$(".invite-crew").fadeIn(100)
	}

	function closeInviteMenu() {
		closePage()

		$(".notify").show()
		$(".top").show()
		$(".bottom").show()
		$(".overlay").show()
		$(".bg").show()
		$(".close-btn").show()
		$(".invite-crew").fadeOut(100)
	}

	$(window).on(
		"message",
		function ({
			originalEvent: {
				data: { action, data },
			},
		}) {
			switch (action) {
				case "OPEN_UI":
					$("body").fadeIn(100)

					break

				case "INIT_DATA":
					let inviteHtml = ""

					if (!areArraysEqual(closestPlayers, data.closestPlayers)) {
						closestPlayers = data.closestPlayers

						closestPlayers.forEach((player) => {
							if (player.distance < 5.0) {
								inviteHtml += `
								<div class="player-wrapper" data-playerid="${player.server_id}">
									<div class="image"><img src="assets/default-user.png" class="invite-image"></div>
									<div class="name">${player.name}</div>
									<div class="id"><span>${("00" + player.server_id).slice(-3)}</span>ID</div>
								</div>
							`
							}
						})

						$(".invite-menu .players").html(inviteHtml)

						$(".invite-menu .players .player-wrapper").click(function () {
							//const childs = $(this).children()
							//const id = parseInt(childs[2].textContent.slice(0, 3))

							$.post(
								`https://${GetParentResourceName()}/invite`,
								JSON.stringify($(this).data("playerid"))
							)
						})
					}

					if (!areObjectsEqual(playerCrew, data.crew)) {
						playerCrew = data.crew

						$("#create-crew").addClass("disabled")
						$("#invite").addClass("disabled")
						$("#player-list").addClass("disabled")
						$("#leave").addClass("disabled")
						$("#leave").show()
						$("#delete").hide()
						$(".only-leader").hide()

						if (isObjectEmpty(playerCrew)) {
							playerData = {}
							$("#create-crew").removeClass("disabled")
						} else {
							playerData = playerCrew.members.find((member) => member.server_id == playerId)

							$("#leave").removeClass("disabled")
							$("#player-list").removeClass("disabled")

							let playerRank = playerData.rank

							if (playerRank == 0) {
								$("#leave").hide()
								$("#delete").show()
								$("#invite").removeClass("disabled")
								$(".only-leader").show()
							}

							let memberListHtml = ""

							playerCrew.members
								.sort((a, b) => a.rank - b.rank)
								.forEach((member) => {
									const rank =
										playerCrew.leader == member.token
											? "Leader"
											: memberRanks[member.rank - 1]?.name || "Member"

									const actions = []

									if (hasPermission(member, "promote")) {
										if (member.rank < memberRanks.length)
											actions[0] = `<img src="assets/rankup.png" id="upgrade-member" data-token="${member.token}" />`

										if (member.rank > 1)
											actions[2] = `<img src="assets/rankdown.png" id="downgrade-member" data-token="${member.token}" />`
									}

									if (hasPermission(member, "kick"))
										actions[1] = `<img src="assets/kick.png" id="kick-member" data-token="${member.token}" />`

									memberListHtml += `
												<tr>
													<td><img src="${member.avatar ?? "assets/default-user.png"}" />${member.name}</td>
													<td>${rank}</td>
													<td>${actions.join("")}</td>
													<td>${member.kills}</td>
													<td>${member.deaths}</td>
												</tr>
											`
								})

							$("#member-list").html(memberListHtml)

							$("#kick-member").click(function () {
								$.post(
									`https://${GetParentResourceName()}/kickMember`,
									JSON.stringify($(this).data("token"))
								)
							})

							$("#upgrade-member, #downgrade-member").click(function () {
								$.post(
									`https://${GetParentResourceName()}/promoteMember`,
									JSON.stringify({
										targetToken: $(this).data("token"),
										rankUp: $(this).attr("id") == "upgrade-member",
									})
								)
							})
						}
					}

					if (!areObjectsEqual(crewList, data.crewList)) {
						crewList = data.crewList

						let sorted = crewList.sort((a, b) => calculateTotalKD(b).kills - calculateTotalKD(a).kills)
						let crewListHtml = ""

						for (let i = 0; i < 10; i++) {
							const crew = sorted[i]

							if (crew) {
								crewListHtml += `
										<tr>
											<td>${i + 1}</td>
											<td>${crew.name}</td>
											<td>${epochToDate(crew.created_at)}</td>
											<td>${crew.members.length}</td>
											<td>${calculateTotalKD(crew).kills}</td>
										</tr>
									`
							}
						}

						if (!isObjectEmpty(playerCrew)) {
							crewListHtml += `
							<tr class="your-crew">
								<td>#${getRankNumber(playerCrew.id)}</td>
								<td>${playerCrew.name}</td>
								<td>${epochToDate(playerCrew.created_at)}</td>
								<td>${playerCrew.members.length}</td>
								<td>${calculateTotalKD(playerCrew).kills}</td>
							</tr>
							`
						}

						$("#crew-list").html(crewListHtml)
					}

					break

				case "INVITED":
					inviteData = {
						crewName: data.crewName,
						senderName: data.senderName,
					}

					openInviteMenu()

					$("body").fadeIn(100)

					break

				case "NOTIFY":
					notify(data.type, data.message)

					break

				default:
					break
			}
		}
	)

	$("#create-crew").click(function () {
		$(".sec-bg").fadeIn(100)
		$(".create-crew").fadeIn(100)
	})

	$(".create-crew .create").click(function () {
		closeMenus()

		const crewName = $(".input-crew").val()

		if (crewName == "") {
			notify("error", locales["CrewNameEmpty"])

			return
		}

		if (crewName.length < 4) {
			notify("error", locales["CrewNameMinLength"])

			return
		}

		if (crewName.length > 12) {
			notify("error", locales["CrewNameMaxLength"])

			return
		}

		$.post(`https://${GetParentResourceName()}/create`, JSON.stringify(crewName))

		$(".input-crew").val("")
	})

	$("#invite").click(function () {
		$(".sec-bg").fadeIn(100)
		$(".invite-menu").fadeIn(100)
	})

	$("#player-list").click(function () {
		$(".bottom").hide()
		$(".crew-members").show()
		$(".close-btn").hide()
		$(".back-btn").show()
	})

	$("#scoreboard").click(function () {
		$(".bottom").hide()
		$(".crew-list").show()
		$(".close-btn").hide()
		$(".back-btn").show()
	})

	$("#leave").click(function () {
		$(".sec-bg").fadeIn(100)
		$(".leave-crew").fadeIn(100)
	})

	$("#delete").click(function () {
		$(".sec-bg").fadeIn(100)
		$(".delete-crew").fadeIn(100)
	})

	$(".btn-accept").click(function () {
		const target = $(this).data("target")

		switch (target) {
			case "join":
				closeInviteMenu()

				$.post(`https://${GetParentResourceName()}/join`, JSON.stringify(inviteData.crewName))
				break
			case "leave":
			case "delete":
				closeMenus()

				$.post(`https://${GetParentResourceName()}/leave`)

				break
		}

		//closePage();
	})

	$(".btn-cancel").click(function () {
		const target = $(this).data("target")

		if (target == "join") closeInviteMenu()
		else closeMenus()
	})

	$(".sec-bg").click(closeMenus)
	$(".back-btn").click(closeLists)
	$(".close-btn").click(closePage)

	$(window).on("keydown", function ({ originalEvent: { key } }) {
		if (key == "Escape") {
			if ($(".sec-bg").css("display") != "none") closeMenus()
			else if ($(".back-btn").css("display") != "none") closeLists()
			else closePage()
		}
	})

	$.post(`https://${GetParentResourceName()}/loaded`, function (data) {
		locales = data.locales
		playerId = data.playerId
		memberRanks = data.memberRanks

		for (const locale in locales) {
			$(`*[data-locale="${locale}"]`).text(locales[locale])
		}
	})
})
