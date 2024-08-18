//--<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- 

//--<+>-- --<+>--  --<+>--  --<+>-- ☾ AMERICAN SCRIPT ☾ --<+>-- --<+>--  --<+>--  --<+>-- 

//--<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- 

const shadow = document.querySelector('.shadow');
const counterInc = document.getElementById('chip');
const curCount = document.getElementById('current-count');
const progressbar = document.querySelector('.progress');
const gameArea = document.getElementById('game-area');
const chip = document.getElementById('chip');
var counter = 0;
var piezasencontradas = null;
var timeleft = null;
let countertext = 0;

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var data = event.data;
        if (data.open == true) {
            piezasencontradas = data.piezasencontradas
            timeleft = data.timer
            $('#start-container').removeClass('hidden');
            const changeProgress = (progress) => {
                progressbar.style.width = `${progress}%`;
                if (progress >= 90) {
                    setTimeout(StartGame(piezasencontradas, timeleft), 1000);
                }
            };
            setTimeout(() => changeProgress(15), 1000);
            setTimeout(() => changeProgress(32), 2000);
            setTimeout(() => changeProgress(65), 3600);
            setTimeout(() => changeProgress(78), 4266);
            setTimeout(() => changeProgress(90), 6000);
        } else if (data.open == false) {
            $('#start-container').addClass('hidden');
            $('#game-container').addClass('hidden');
            location.reload();
        }
        $(document).keyup(function (exit) {
            if (exit.keyCode === 27) {     
                CloseGame();      
            }      
        })
    })
})

// starts game
function StartGame() {
    $('#start-container').addClass('hidden');
    $('#game-container').removeClass('hidden');
    document.addEventListener('mousemove', (e) => {
        let x = e.clientX - (document.documentElement.clientWidth * 1.5);
        let y = e.clientY - (document.documentElement.clientHeight * 1.5);
        shadow.style.transform = 'translate(' + x + 'px, ' + y + 'px)';
    })
    var w = gameArea.offsetWidth || gameArea.style.width
    var h = gameArea.offsetHeight || gameArea.style.height
    $('#chip').click(function(){
        this.style.top = Math.round(Math.random() * h) + "px";
        this.style.left = Math.round(Math.random() * w) + "px";
        AddCounter()
    })
    StartCountdown()
}

// starts countdown timer
function StartCountdown() {
    var htmlResult = '<h2>CHIPS FOUND<h2>'+
    '<h2>'+counter+'/'+piezasencontradas+'</h2>'
    $('#info-container').html(htmlResult);
}

// countdown timer
const countdown = setInterval(function() {
    if (timeleft === 0) {
        if (counter <= piezasencontradas) {
            clearInterval(countdown);
            setTimeout(CloseGame(), 1000);
        }
    } else {
        document.getElementById("countdown").innerHTML = '<h2>'+timeleft+ 's REMAINING</h2>';
    }
    timeleft -= 1;
}, 1000);

// adds counter when chip found
function AddCounter() {
    var htmlResult = '<h2>CHIPS FOUND<h2>'+
    '<h2>'+counter+'/'+piezasencontradas+'</h2>'
    $('#info-container').html(htmlResult);
    if (counter == piezasencontradas) {
        $('#game-container').addClass('hidden');
        clearInterval(countdown);
        $.post(`https://am_hackgame/CounterCallback`, JSON.stringify({'success': true}));
    }
}

// closes game
function CloseGame() {
    $.post(`https://am_hackgame/CloseGame`, JSON.stringify({'success': false}));
}

// increments counter
const handleIncrement = () => {
    counter++;
    curCount.innerHTML = counter;
};
counterInc.addEventListener("click", handleIncrement);




/* 
class TextScramble {
  constructor(el) {
    this.el = el;
    this.chars = "!<>-_\\/[]{}—=+*^?#________";
    this.update = this.update.bind(this);
  }
  setText(newText) {
    const oldText = this.el.innerText;
    const length = Math.max(oldText.length, newText.length);
    const promise = new Promise((resolve) => (this.resolve = resolve));
    this.queue = [];
    for (let i = 0; i < length; i++) {
      const from = oldText[i] || "";
      const to = newText[i] || "";
      const start = Math.floor(Math.random() * 40);
      const end = start + Math.floor(Math.random() * 40);
      this.queue.push({ from, to, start, end });
    }
    cancelAnimationFrame(this.frameRequest);
    this.frame = 0;
    this.update();
    return promise;
  }
  update() {
    let output = "";
    let complete = 0;
    for (let i = 0, n = this.queue.length; i < n; i++) {
      let { from, to, start, end, char } = this.queue[i];
      if (this.frame >= end) {
        complete++;
        output += to;
      } else if (this.frame >= start) {
        if (!char || Math.random() < 0.28) {
          char = this.randomChar();
          this.queue[i].char = char;
        }
        output += `<span class="dud">${char}</span>`;
      } else {
        output += from;
      }
    }
    this.el.innerHTML = output;
    if (complete === this.queue.length) {
      this.resolve();
    } else {
      this.frameRequest = requestAnimationFrame(this.update);
      this.frame++;
    }
  }
  randomChar() {
    return this.chars[Math.floor(Math.random() * this.chars.length)];
  }
}

const phrases = [
  "Hey,",
  "put here all the sentences",
  "that you want to cycle",
  "they will all be automatically displayed.",
  "Just",
  "Like",
  "This.",
  "Have fun :)"
];

const el = document.querySelector(".text");
const fx = new TextScramble(el);


const next = () => {
  fx.setText(phrases[countertext]).then(() => {
    setTimeout(next, 800);
  });
  countertext = (countertext + 1) % phrases.length;
};

next(); */

