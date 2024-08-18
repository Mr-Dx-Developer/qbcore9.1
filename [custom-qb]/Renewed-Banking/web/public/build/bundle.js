var app = function() {
    "use strict";

    function t() {}

    function n(t) { return t() }

    function e() { return Object.create(null) }

    function s(t) { t.forEach(n) }

    function c(t) { return "function" == typeof t }

    function o(t, n) { return t != t ? n == n : t !== n || t && "object" == typeof t || "function" == typeof t }
    let r, a;

    function i(n, e, s) { n.$$.on_destroy.push(function(n, ...e) { if (null == n) return t; const s = n.subscribe(...e); return s.unsubscribe ? () => s.unsubscribe() : s }(e, s)) }

    function l(t, n, e, s) { return t[1] && s ? function(t, n) { for (const e in n) t[e] = n[e]; return t }(e.ctx.slice(), t[1](s(n))) : e.ctx }

    function u(t, n) { t.appendChild(n) }

    function f(t, n, e) { t.insertBefore(n, e || null) }

    function d(t) { t.parentNode.removeChild(t) }

    function p(t) { return document.createElement(t) }

    function m(t) { return document.createTextNode(t) }

    function g() { return m(" ") }

    function v() { return m("") }

    function $(t, n, e, s) { return t.addEventListener(n, e, s), () => t.removeEventListener(n, e, s) }

    function h(t, n, e) { null == e ? t.removeAttribute(n) : t.getAttribute(n) !== e && t.setAttribute(n, e) }

    function y(t) { return "" === t ? null : +t }

    function b(t, n) { n = "" + n, t.wholeText !== n && (t.data = n) }

    function w(t, n) { t.value = null == n ? "" : n }

    function _(t, n, e) { t.classList[e ? "add" : "remove"](n) }

    function x(t) { a = t }

    function j() { if (!a) throw new Error("Function called outside component initialization"); return a }

    function k(t) { j().$$.on_mount.push(t) }
    const z = [],
        E = [],
        T = [],
        L = [],
        M = Promise.resolve();
    let N = !1;

    function S(t) { T.push(t) }
    const C = new Set;
    let O = 0;

    function U() {
        const t = a;
        do {
            for (; O < z.length;) {
                const t = z[O];
                O++, x(t), A(t.$$)
            }
            for (x(null), z.length = 0, O = 0; E.length;) E.pop()();
            for (let t = 0; t < T.length; t += 1) {
                const n = T[t];
                C.has(n) || (C.add(n), n())
            }
            T.length = 0
        } while (z.length);
        for (; L.length;) L.pop()();
        N = !1, C.clear(), x(t)
    }

    function A(t) {
        if (null !== t.fragment) {
            t.update(), s(t.before_update);
            const n = t.dirty;
            t.dirty = [-1], t.fragment && t.fragment.p(t.ctx, n), t.after_update.forEach(S)
        }
    }
    const P = new Set;
    let V;

    function B() { V = { r: 0, c: [], p: V } }

    function I() { V.r || s(V.c), V = V.p }

    function Y(t, n) { t && t.i && (P.delete(t), t.i(n)) }

    function F(t, n, e, s) {
        if (t && t.o) {
            if (P.has(t)) return;
            P.add(t), V.c.push((() => { P.delete(t), s && (e && t.d(1), s()) })), t.o(n)
        } else s && s()
    }

    function Z(t, n) { F(t, 1, 1, (() => { n.delete(t.key) })) }

    function R(t, n, e, s, c, o, r, a, i, l, u, f) {
        let d = t.length,
            p = o.length,
            m = d;
        const g = {};
        for (; m--;) g[t[m].key] = m;
        const v = [],
            $ = new Map,
            h = new Map;
        for (m = p; m--;) {
            const t = f(c, o, m),
                a = e(t);
            let i = r.get(a);
            i ? s && i.p(t, n) : (i = l(a, t), i.c()), $.set(a, v[m] = i), a in g && h.set(a, Math.abs(m - g[a]))
        }
        const y = new Set,
            b = new Set;

        function w(t) { Y(t, 1), t.m(a, u), r.set(t.key, t), u = t.first, p-- }
        for (; d && p;) {
            const n = v[p - 1],
                e = t[d - 1],
                s = n.key,
                c = e.key;
            n === e ? (u = n.first, d--, p--) : $.has(c) ? !r.has(s) || y.has(s) ? w(n) : b.has(c) ? d-- : h.get(s) > h.get(c) ? (b.add(s), w(n)) : (y.add(c), d--) : (i(e, r), d--)
        }
        for (; d--;) {
            const n = t[d];
            $.has(n.key) || i(n, r)
        }
        for (; p;) w(v[p - 1]);
        return v
    }

    function W(t) { t && t.c() }

    function X(t, e, o, r) {
        const { fragment: a, on_mount: i, on_destroy: l, after_update: u } = t.$$;
        a && a.m(e, o), r || S((() => {
            const e = i.map(n).filter(c);
            l ? l.push(...e) : s(e), t.$$.on_mount = []
        })), u.forEach(S)
    }

    function q(t, n) {
        const e = t.$$;
        null !== e.fragment && (s(e.on_destroy), e.fragment && e.fragment.d(n), e.on_destroy = e.fragment = null, e.ctx = [])
    }

    function H(t, n) {-1 === t.$$.dirty[0] && (z.push(t), N || (N = !0, M.then(U)), t.$$.dirty.fill(0)), t.$$.dirty[n / 31 | 0] |= 1 << n % 31 }

    function J(n, c, o, r, i, l, u, f = [-1]) {
        const p = a;
        x(n);
        const m = n.$$ = { fragment: null, ctx: null, props: l, update: t, not_equal: i, bound: e(), on_mount: [], on_destroy: [], on_disconnect: [], before_update: [], after_update: [], context: new Map(c.context || (p ? p.$$.context : [])), callbacks: e(), dirty: f, skip_bound: !1, root: c.target || p.$$.root };
        u && u(m.root);
        let g = !1;
        if (m.ctx = o ? o(n, c.props || {}, ((t, e, ...s) => { const c = s.length ? s[0] : e; return m.ctx && i(m.ctx[t], m.ctx[t] = c) && (!m.skip_bound && m.bound[t] && m.bound[t](c), g && H(n, t)), e })) : [], m.update(), g = !0, s(m.before_update), m.fragment = !!r && r(m.ctx), c.target) {
            if (c.hydrate) {
                const t = function(t) { return Array.from(t.childNodes) }(c.target);
                m.fragment && m.fragment.l(t), t.forEach(d)
            } else m.fragment && m.fragment.c();
            c.intro && Y(n.$$.fragment), X(n, c.target, c.anchor, c.customElement), U()
        }
        x(p)
    }
    class D {
        $destroy() { q(this, 1), this.$destroy = t }
        $on(t, n) { const e = this.$$.callbacks[t] || (this.$$.callbacks[t] = []); return e.push(n), () => { const t = e.indexOf(n); - 1 !== t && e.splice(t, 1) } }
        $set(t) {
            var n;
            this.$$set && (n = t, 0 !== Object.keys(n).length) && (this.$$.skip_bound = !0, this.$$set(t), this.$$.skip_bound = !1)
        }
    }
    const G = atob("UmVuZXdlZC1CYW5raW5n");
    async function K(t, n = {}) {
        const e = { method: "post", headers: { "Content-Type": "application/json; charset=UTF-8" }, body: JSON.stringify(n) },
            s = await fetch(`https://${G}/${t}`, e);
        return await s.json()
    }
    const Q = [];

    function tt(n, e = t) {
        let s;
        const c = new Set;

        function r(t) {
            if (o(n, t) && (n = t, s)) {
                const t = !Q.length;
                for (const t of c) t[1](), Q.push(t, n);
                if (t) {
                    for (let t = 0; t < Q.length; t += 2) Q[t][0](Q[t + 1]);
                    Q.length = 0
                }
            }
        }
        return { set: r, update: function(t) { r(t(n)) }, subscribe: function(o, a = t) { const i = [o, a]; return c.add(i), 1 === c.size && (s = e(r) || t), o(n), () => { c.delete(i), 0 === c.size && (s(), s = null) } } }
    }
    const nt = tt(!1),
        et = tt(!1),
        st = tt("");
    let ct = tt(null);
    const ot = tt(!1);
    let rt = tt({ account: {}, actionType: "" });
    const at = tt([]),
        it = tt([]);

    function lt(t, n) {
        const e = e => { e.data.action === t && n(e.data) };
        var s;
        k((() => window.addEventListener("message", e))), s = () => window.removeEventListener("message", e), j().$$.on_destroy.push(s)
    }

    function ut(t) {
        let n;
        const e = t[2].default,
            s = function(t, n, e, s) { if (t) { const c = l(t, n, e, s); return t[0](c) } }(e, t, t[1], null);
        return {
            c() { s && s.c() },
            m(t, e) { s && s.m(t, e), n = !0 },
            p(t, c) {
                s && s.p && (!n || 2 & c) && function(t, n, e, s, c, o) {
                    if (c) {
                        const r = l(n, e, s, o);
                        t.p(r, c)
                    }
                }(s, e, t, t[1], n ? function(t, n, e, s) {
                    if (t[2] && s) {
                        const c = t[2](s(e));
                        if (void 0 === n.dirty) return c;
                        if ("object" == typeof c) {
                            const t = [],
                                e = Math.max(n.dirty.length, c.length);
                            for (let s = 0; s < e; s += 1) t[s] = n.dirty[s] | c[s];
                            return t
                        }
                        return n.dirty | c
                    }
                    return n.dirty
                }(e, t[1], c, null) : function(t) {
                    if (t.ctx.length > 32) {
                        const n = [],
                            e = t.ctx.length / 32;
                        for (let t = 0; t < e; t++) n[t] = -1;
                        return n
                    }
                    return -1
                }(t[1]), null)
            },
            i(t) { n || (Y(s, t), n = !0) },
            o(t) { F(s, t), n = !1 },
            d(t) { s && s.d(t) }
        }
    }

    function ft(t) { let n, e, s = t[0] && ut(t); return { c() { s && s.c(), n = v() }, m(t, c) { s && s.m(t, c), f(t, n, c), e = !0 }, p(t, [e]) { t[0] ? s ? (s.p(t, e), 1 & e && Y(s, 1)) : (s = ut(t), s.c(), Y(s, 1), s.m(n.parentNode, n)) : s && (B(), F(s, 1, 1, (() => { s = null })), I()) }, i(t) { e || (Y(s), e = !0) }, o(t) { F(s), e = !1 }, d(t) { s && s.d(t), t && d(n) } } }

    function dt(t, n, e) { let s, { $$slots: c = {}, $$scope: o } = n; return nt.subscribe((t => { e(0, s = t) })), lt("setVisible", (t => { at.set(t.accounts), ct.update((() => t.accounts[0].id)), nt.set(t.status), et.set(t.loading), ot.set(t.atm) })), lt("setLoading", (t => { et.set(t.status) })), lt("notify", (t => { st.set(t.status), setTimeout((() => { st.set("") }), 3500) })), lt("updateLocale", (t => { it.set(t.translations) })), k((() => { const t = t => { s && ["Escape"].includes(t.code) && (K("closeInterface"), nt.set(!1), rt.update((t => Object.assign(Object.assign({}, t), { actionType: "" })))) }; return window.addEventListener("keydown", t), () => window.removeEventListener("keydown", t) })), t.$$set = t => { "$$scope" in t && e(1, o = t.$$scope) }, [s, o, c] }
    class pt extends D { constructor(t) { super(), J(this, t, dt, ft, o, {}) } }

    function mt(t) { return t.toLocaleString("en-US", { style: "currency", currency: "USD" }) }
    const gt = (t, n = 1e3) => {
        if (!window.invokeNative)
            for (const e of t) setTimeout((() => { window.dispatchEvent(new MessageEvent("message", { data: { action: e.action, data: e.data } })) }), n)
    };

    function vt(t) { let n, e = t[2].frozen + ""; return { c() { n = m(e) }, m(t, e) { f(t, n, e) }, p(t, s) { 4 & s && e !== (e = t[2].frozen + "") && b(n, e) }, d(t) { t && d(n) } } }

    function $t(t) {
        let n, e, c, o, r, a, i, l, v = t[2].withdraw_but + "",
            y = t[2].transfer_but + "",
            w = !t[1] && ht(t);
        return { c() { w && w.c(), n = g(), e = p("button"), c = m(v), o = g(), r = p("button"), a = m(y), h(e, "class", "btn btn-orange"), h(r, "class", "btn btn-grey") }, m(s, d) { w && w.m(s, d), f(s, n, d), f(s, e, d), u(e, c), f(s, o, d), f(s, r, d), u(r, a), i || (l = [$(e, "click", t[6]), $(r, "click", t[7])], i = !0) }, p(t, e) { t[1] ? w && (w.d(1), w = null) : w ? w.p(t, e) : (w = ht(t), w.c(), w.m(n.parentNode, n)), 4 & e && v !== (v = t[2].withdraw_but + "") && b(c, v), 4 & e && y !== (y = t[2].transfer_but + "") && b(a, y) }, d(t) { w && w.d(t), t && d(n), t && d(e), t && d(o), t && d(r), i = !1, s(l) } }
    }

    function ht(t) { let n, e, s, c, o = t[2].deposit_but + ""; return { c() { n = p("button"), e = m(o), h(n, "class", "btn btn-green") }, m(o, r) { f(o, n, r), u(n, e), s || (c = $(n, "click", t[5]), s = !0) }, p(t, n) { 4 & n && o !== (o = t[2].deposit_but + "") && b(e, o) }, d(t) { t && d(n), s = !1, c() } } }

    function yt(n) {
        let e, s, c, o, r, a, i, l, v, y, w, _, x, j, k, z, E, T, L, M, N, S, C, O, U, A, P, V = n[0].type + "",
            B = n[2].account + "",
            I = n[0].id + "",
            Y = n[0].type + "",
            F = n[2].account + "",
            Z = n[0].name + "",
            R = mt(n[0].amount) + "",
            W = n[2].balance + "";

        function X(t, n) { return t[0].isFrozen ? vt : $t }
        let q = X(n),
            H = q(n);
        return { c() { e = p("section"), s = p("h4"), c = m(V), o = m(B), r = m("/ "), a = m(I), i = g(), l = p("h5"), v = m(Y), y = m(F), w = p("br"), _ = g(), x = p("span"), j = m(Z), k = g(), z = p("div"), E = p("strong"), T = m(R), L = g(), M = p("br"), N = g(), S = p("span"), C = m(W), O = g(), U = p("div"), H.c(), h(s, "class", "svelte-11vvjn0"), h(x, "class", "svelte-11vvjn0"), h(l, "class", "svelte-11vvjn0"), h(E, "class", "svelte-11vvjn0"), h(z, "class", "price svelte-11vvjn0"), h(U, "class", "btns-group svelte-11vvjn0"), h(e, "class", "account svelte-11vvjn0") }, m(t, d) { f(t, e, d), u(e, s), u(s, c), u(s, o), u(s, r), u(s, a), u(e, i), u(e, l), u(l, v), u(l, y), u(l, w), u(l, _), u(l, x), u(x, j), u(e, k), u(e, z), u(z, E), u(E, T), u(z, L), u(z, M), u(z, N), u(z, S), u(S, C), u(e, O), u(e, U), H.m(U, null), A || (P = $(e, "click", n[8]), A = !0) }, p(t, [n]) { 1 & n && V !== (V = t[0].type + "") && b(c, V), 4 & n && B !== (B = t[2].account + "") && b(o, B), 1 & n && I !== (I = t[0].id + "") && b(a, I), 1 & n && Y !== (Y = t[0].type + "") && b(v, Y), 4 & n && F !== (F = t[2].account + "") && b(y, F), 1 & n && Z !== (Z = t[0].name + "") && b(j, Z), 1 & n && R !== (R = mt(t[0].amount) + "") && b(T, R), 4 & n && W !== (W = t[2].balance + "") && b(C, W), q === (q = X(t)) && H ? H.p(t, n) : (H.d(1), H = q(t), H && (H.c(), H.m(U, null))) }, i: t, o: t, d(t) { t && d(e), H.d(), A = !1, P() } }
    }

    function bt(t, n, e) {
        let s, c;
        i(t, at, (t => e(9, s = t))), i(t, it, (t => e(2, c = t)));
        let o, { account: r } = n;

        function a(t) { ct.update((() => t)) }

        function l(t, n) {
            let e = s.find((n => t === n.id));
            rt.update((() => ({ actionType: n, account: e })))
        }
        ot.subscribe((t => { e(1, o = t) }));
        return t.$$set = t => { "account" in t && e(0, r = t.account) }, [r, o, c, a, l, () => l(r.id, "deposit"), () => l(r.id, "withdraw"), () => l(r.id, "transfer"), () => a(r.id)]
    }
    class wt extends D { constructor(t) { super(), J(this, t, bt, yt, o, { account: 0 }) } }

    function _t(t, n, e) { const s = t.slice(); return s[2] = n[e], s }

    function xt(t, n) {
        let e, s, c;
        return s = new wt({ props: { account: n[2] } }), {
            key: t,
            first: null,
            c() { e = v(), W(s.$$.fragment), this.first = e },
            m(t, n) { f(t, e, n), X(s, t, n), c = !0 },
            p(t, e) {
                n = t;
                const c = {};
                2 & e && (c.account = n[2]), s.$set(c)
            },
            i(t) { c || (Y(s.$$.fragment, t), c = !0) },
            o(t) { F(s.$$.fragment, t), c = !1 },
            d(t) { t && d(e), q(s, t) }
        }
    }

    function jt(t) {
        let n, e, s, c, o, r, a = t[0].accounts + "",
            i = [],
            l = new Map,
            v = t[1];
        const $ = t => t[2].id;
        for (let n = 0; n < v.length; n += 1) {
            let e = _t(t, v, n),
                s = $(e);
            l.set(s, i[n] = xt(s, e))
        }
        return {
            c() {
                n = p("aside"), e = p("h3"), s = m(a), c = g(), o = p("section");
                for (let t = 0; t < i.length; t += 1) i[t].c();
                h(e, "class", "heading"), h(o, "class", "scroller"), h(n, "class", "svelte-1psnybp")
            },
            m(t, a) {
                f(t, n, a), u(n, e), u(e, s), u(n, c), u(n, o);
                for (let t = 0; t < i.length; t += 1) i[t].m(o, null);
                r = !0
            },
            p(t, [n]) {
                (!r || 1 & n) && a !== (a = t[0].accounts + "") && b(s, a), 2 & n && (v = t[1], B(), i = R(i, n, $, 1, t, v, l, o, Z, xt, null, _t), I())
            },
            i(t) {
                if (!r) {
                    for (let t = 0; t < v.length; t += 1) Y(i[t]);
                    r = !0
                }
            },
            o(t) {
                for (let t = 0; t < i.length; t += 1) F(i[t]);
                r = !1
            },
            d(t) { t && d(n); for (let t = 0; t < i.length; t += 1) i[t].d() }
        }
    }

    function kt(t, n, e) { let s, c; return i(t, it, (t => e(0, s = t))), i(t, at, (t => e(1, c = t))), [s, c] }
    class zt extends D { constructor(t) { super(), J(this, t, kt, jt, o, {}) } }

    function Et(t) { let n; return { c() { n = m(" ") }, m(t, e) { f(t, n, e) }, d(t) { t && d(n) } } }

    function Tt(t) { let n; return { c() { n = m("-") }, m(t, e) { f(t, n, e) }, d(t) { t && d(n) } } }

    function Lt(n) {
        let e, s, c, o, r, a, i, l, v, $, y, w, x, j, k, z, E, T, L, M, N, S, C, O, U, A, P, V, B, I, Y, F, Z = n[0].title + "",
            R = n[0].trans_type.toUpperCase() + "",
            W = n[0].trans_id + "",
            X = mt(n[0].amount) + "",
            q = n[0].receiver + "",
            H = n[0].time + "",
            J = n[0].issuer + "",
            D = n[1].message + "",
            G = n[0].message + "";

        function K(t, n) { return "withdraw" === t[0].trans_type ? Tt : Et }
        let Q = K(n),
            tt = Q(n);
        return { c() { e = p("section"), s = p("h5"), c = p("span"), o = m(Z), r = m("\r\n            ["), a = m(R), i = m("]"), l = g(), v = p("span"), $ = m(W), y = g(), w = p("h4"), x = p("span"), tt.c(), j = g(), k = m(X), z = g(), E = p("span"), T = m(q), L = g(), M = p("span"), N = m(H), S = g(), C = p("br"), O = g(), U = m(J), A = g(), P = p("h6"), V = m(D), B = g(), I = p("br"), Y = g(), F = m(G), h(c, "class", "svelte-w3ny0j"), h(v, "class", "svelte-w3ny0j"), h(s, "class", "svelte-w3ny0j"), h(x, "class", "svelte-w3ny0j"), _(x, "withdraw", "withdraw" === n[0].trans_type), h(E, "class", "svelte-w3ny0j"), h(M, "class", "svelte-w3ny0j"), h(w, "class", "svelte-w3ny0j"), h(P, "class", "svelte-w3ny0j"), h(e, "class", "transaction svelte-w3ny0j") }, m(t, n) { f(t, e, n), u(e, s), u(s, c), u(c, o), u(c, r), u(c, a), u(c, i), u(s, l), u(s, v), u(v, $), u(e, y), u(e, w), u(w, x), tt.m(x, null), u(x, j), u(x, k), u(w, z), u(w, E), u(E, T), u(w, L), u(w, M), u(M, N), u(M, S), u(M, C), u(M, O), u(M, U), u(e, A), u(e, P), u(P, V), u(P, B), u(P, I), u(P, Y), u(P, F) }, p(t, [n]) { 1 & n && Z !== (Z = t[0].title + "") && b(o, Z), 1 & n && R !== (R = t[0].trans_type.toUpperCase() + "") && b(a, R), 1 & n && W !== (W = t[0].trans_id + "") && b($, W), Q !== (Q = K(t)) && (tt.d(1), tt = Q(t), tt && (tt.c(), tt.m(x, j))), 1 & n && X !== (X = mt(t[0].amount) + "") && b(k, X), 1 & n && _(x, "withdraw", "withdraw" === t[0].trans_type), 1 & n && q !== (q = t[0].receiver + "") && b(T, q), 1 & n && H !== (H = t[0].time + "") && b(N, H), 1 & n && J !== (J = t[0].issuer + "") && b(U, J), 2 & n && D !== (D = t[1].message + "") && b(V, D), 1 & n && G !== (G = t[0].message + "") && b(F, G) }, i: t, o: t, d(t) { t && d(e), tt.d() } }
    }

    function Mt(t, n, e) {
        let s;
        i(t, it, (t => e(1, s = t)));
        let { transaction: c } = n;
        return t.$$set = t => { "transaction" in t && e(0, c = t.transaction) }, [c, s]
    }
    class Nt extends D { constructor(t) { super(), J(this, t, Mt, Lt, o, { transaction: 0 }) } }

    function St(t, n, e) { const s = t.slice(); return s[4] = n[e], s }

    function Ct(n) { let e, s = n[1].select_account + ""; return { c() { e = m(s) }, m(t, n) { f(t, e, n) }, p(t, n) { 2 & n && s !== (s = t[1].select_account + "") && b(e, s) }, i: t, o: t, d(t) { t && d(e) } } }

    function Ot(t) {
        let n, e, s = [],
            c = new Map,
            o = t[0].transactions;
        const r = t => t[4].trans_id;
        for (let n = 0; n < o.length; n += 1) {
            let e = St(t, o, n),
                a = r(e);
            c.set(a, s[n] = Ut(a, e))
        }
        return {
            c() {
                for (let t = 0; t < s.length; t += 1) s[t].c();
                n = v()
            },
            m(t, c) {
                for (let n = 0; n < s.length; n += 1) s[n].m(t, c);
                f(t, n, c), e = !0
            },
            p(t, e) { 1 & e && (o = t[0].transactions, B(), s = R(s, e, r, 1, t, o, c, n.parentNode, Z, Ut, n, St), I()) },
            i(t) {
                if (!e) {
                    for (let t = 0; t < o.length; t += 1) Y(s[t]);
                    e = !0
                }
            },
            o(t) {
                for (let t = 0; t < s.length; t += 1) F(s[t]);
                e = !1
            },
            d(t) {
                for (let n = 0; n < s.length; n += 1) s[n].d(t);
                t && d(n)
            }
        }
    }

    function Ut(t, n) {
        let e, s, c;
        return s = new Nt({ props: { transaction: n[4] } }), {
            key: t,
            first: null,
            c() { e = v(), W(s.$$.fragment), this.first = e },
            m(t, n) { f(t, e, n), X(s, t, n), c = !0 },
            p(t, e) {
                n = t;
                const c = {};
                1 & e && (c.transaction = n[4]), s.$set(c)
            },
            i(t) { c || (Y(s.$$.fragment, t), c = !0) },
            o(t) { F(s.$$.fragment, t), c = !1 },
            d(t) { t && d(e), q(s, t) }
        }
    }

    function At(t) {
        let n, e, s, c, o, a, i, l, v, $, y, w, _, x, j, k, z = t[1].transactions + "",
            E = t[1].bank_name + "";
        const T = [Ot, Ct],
            L = [];

        function M(t, n) { return t[0] ? 0 : 1 }
        return x = M(t), j = L[x] = T[x](t), {
            c() {
                var t, u;
                n = p("section"), e = p("h3"), s = p("span"), c = m(z), o = g(), a = p("div"), i = p("img"), v = g(), $ = p("span"), y = m(E), w = g(), _ = p("section"), j.c(), t = i.src, u = l = "./img/bank.png", r || (r = document.createElement("a")), r.href = u, t !== r.href && h(i, "src", "./img/bank.png"), h(i, "alt", "bang icon"), h(i, "class", "svelte-mhvyj0"), h(a, "class", "svelte-mhvyj0"), h(e, "class", "heading svelte-mhvyj0"), h(_, "class", "scroller"), h(n, "class", "transactions-container svelte-mhvyj0")
            },
            m(t, r) { f(t, n, r), u(n, e), u(e, s), u(s, c), u(e, o), u(e, a), u(a, i), u(a, v), u(a, $), u($, y), u(n, w), u(n, _), L[x].m(_, null), k = !0 },
            p(t, [n]) {
                (!k || 2 & n) && z !== (z = t[1].transactions + "") && b(c, z), (!k || 2 & n) && E !== (E = t[1].bank_name + "") && b(y, E);
                let e = x;
                x = M(t), x === e ? L[x].p(t, n) : (B(), F(L[e], 1, 1, (() => { L[e] = null })), I(), j = L[x], j ? j.p(t, n) : (j = L[x] = T[x](t), j.c()), Y(j, 1), j.m(_, null))
            },
            i(t) { k || (Y(j), k = !0) },
            o(t) { F(j), k = !1 },
            d(t) { t && d(n), L[x].d() }
        }
    }

    function Pt(t, n, e) { let s, c, o, r; return i(t, ct, (t => e(2, c = t))), i(t, at, (t => e(3, o = t))), i(t, it, (t => e(1, r = t))), t.$$.update = () => { 12 & t.$$.dirty && e(0, s = o.find((t => c === t.id))) }, [s, r, c, o] }
    class Vt extends D { constructor(t) { super(), J(this, t, Pt, At, o, {}) } }

    function Bt(t) {
        let n, e, s, c, o, r, a, i, l, v, $ = t[0].cash + "",
            y = t[1][0].cash + "";
        return s = new zt({}), o = new Vt({}), {
            c() { n = p("div"), e = p("section"), W(s.$$.fragment), c = g(), W(o.$$.fragment), r = g(), a = p("h5"), i = m($), l = m(y), h(e, "class", "svelte-xwmgc0"), h(a, "class", "svelte-xwmgc0"), h(n, "class", "main svelte-xwmgc0") },
            m(t, d) { f(t, n, d), u(n, e), X(s, e, null), u(e, c), X(o, e, null), u(n, r), u(n, a), u(a, i), u(a, l), v = !0 },
            p(t, [n]) {
                (!v || 1 & n) && $ !== ($ = t[0].cash + "") && b(i, $), (!v || 2 & n) && y !== (y = t[1][0].cash + "") && b(l, y)
            },
            i(t) { v || (Y(s.$$.fragment, t), Y(o.$$.fragment, t), v = !0) },
            o(t) { F(s.$$.fragment, t), F(o.$$.fragment, t), v = !1 },
            d(t) { t && d(n), q(s), q(o) }
        }
    }

    function It(t, n, e) { let s, c; return i(t, it, (t => e(0, s = t))), i(t, at, (t => e(1, c = t))), [s, c] }
    class Yt extends D { constructor(t) { super(), J(this, t, It, Bt, o, {}) } }

    function Ft(t) { let n, e, s, c, o, r, a, i = t[4].transfer + ""; return { c() { n = p("div"), e = p("label"), s = m(i), c = g(), o = p("input"), h(e, "for", "stateId"), h(e, "class", "svelte-1ou14c8"), h(o, "type", "text"), h(o, "name", "stateId"), h(o, "id", "stateId"), h(o, "placeholder", "#"), h(o, "class", "svelte-1ou14c8"), h(n, "class", "form-row svelte-1ou14c8") }, m(i, l) { f(i, n, l), u(n, e), u(e, s), u(n, c), u(n, o), w(o, t[2]), r || (a = $(o, "input", t[11]), r = !0) }, p(t, n) { 16 & n && i !== (i = t[4].transfer + "") && b(s, i), 4 & n && o.value !== t[2] && w(o, t[2]) }, d(t) { t && d(n), r = !1, a() } } }

    function Zt(n) {
        let e, c, o, r, a, i, l, v, _, x, j, k, z, E, T, L, M, N, S, C, O, U, A, P, V, B, I, Y, F, Z, R = n[3].account.type + "",
            W = n[4].account + "",
            X = n[3].account.id + "",
            q = n[4].amount + "",
            H = n[4].comment + "",
            J = n[4].cancel + "",
            D = n[4].confirm + "",
            G = "transfer" === n[3].actionType && Ft(n);
        return { c() { e = p("section"), c = p("section"), o = p("h2"), r = m(R), a = m(W), i = m("/ "), l = m(X), v = g(), _ = p("form"), x = p("div"), j = p("label"), k = m(q), z = g(), E = p("input"), T = g(), L = p("div"), M = p("label"), N = m(H), S = g(), C = p("input"), O = g(), G && G.c(), U = g(), A = p("div"), P = p("button"), V = m(J), B = g(), I = p("button"), Y = m(D), h(o, "class", "svelte-1ou14c8"), h(j, "for", "amount"), h(j, "class", "svelte-1ou14c8"), h(E, "type", "number"), h(E, "name", "amount"), h(E, "id", "amount"), h(E, "placeholder", "$"), h(E, "class", "svelte-1ou14c8"), h(x, "class", "form-row svelte-1ou14c8"), h(M, "for", "comment"), h(M, "class", "svelte-1ou14c8"), h(C, "type", "text"), h(C, "name", "comment"), h(C, "id", "comment"), h(C, "placeholder", "//"), h(C, "class", "svelte-1ou14c8"), h(L, "class", "form-row svelte-1ou14c8"), h(P, "type", "button"), h(P, "class", "btn btn-orange"), h(I, "type", "button"), h(I, "class", "btn btn-green"), h(A, "class", "btns-group"), h(_, "action", "#"), h(c, "class", "popup-content svelte-1ou14c8"), h(e, "class", "popup-container svelte-1ou14c8") }, m(t, s) { f(t, e, s), u(e, c), u(c, o), u(o, r), u(o, a), u(o, i), u(o, l), u(c, v), u(c, _), u(_, x), u(x, j), u(j, k), u(x, z), u(x, E), w(E, n[0]), u(_, T), u(_, L), u(L, M), u(M, N), u(L, S), u(L, C), w(C, n[1]), u(_, O), G && G.m(_, null), u(_, U), u(_, A), u(A, P), u(P, V), u(A, B), u(A, I), u(I, Y), F || (Z = [$(E, "input", n[9]), $(C, "input", n[10]), $(P, "click", n[5]), $(I, "click", n[12])], F = !0) }, p(t, [n]) { 8 & n && R !== (R = t[3].account.type + "") && b(r, R), 16 & n && W !== (W = t[4].account + "") && b(a, W), 8 & n && X !== (X = t[3].account.id + "") && b(l, X), 16 & n && q !== (q = t[4].amount + "") && b(k, q), 1 & n && y(E.value) !== t[0] && w(E, t[0]), 16 & n && H !== (H = t[4].comment + "") && b(N, H), 2 & n && C.value !== t[1] && w(C, t[1]), "transfer" === t[3].actionType ? G ? G.p(t, n) : (G = Ft(t), G.c(), G.m(_, U)) : G && (G.d(1), G = null), 16 & n && J !== (J = t[4].cancel + "") && b(V, J), 16 & n && D !== (D = t[4].confirm + "") && b(Y, D) }, i: t, o: t, d(t) { t && d(e), G && G.d(), F = !1, s(Z) } }
    }

    function Rt(t, n, e) {
        let s, c, o, r;
        i(t, rt, (t => e(3, s = t))), i(t, ct, (t => e(7, c = t))), i(t, at, (t => e(8, o = t))), i(t, it, (t => e(4, r = t)));
        let a = 0,
            l = "",
            u = "";

        function f() { rt.update((t => Object.assign(Object.assign({}, t), { actionType: "" }))) }

        function d() { et.set(!0), K(s.actionType, { fromAccount: s.account.id, amount: a, comment: l, stateid: u }).then((t => { setTimeout((() => {!1 !== t && at.set(t), et.set(!1) }), 1e3) })), f() }
        return t.$$.update = () => { 384 & t.$$.dirty && o.find((t => c === t.id)) }, [a, l, u, s, r, f, d, c, o, function() { a = y(this.value), e(0, a) }, function() { l = this.value, e(1, l) }, function() { u = this.value, e(2, u) }, () => d()]
    }
    class Wt extends D { constructor(t) { super(), J(this, t, Rt, Zt, o, {}) } }

    function Xt(n) { let e; return { c() { e = p("section"), e.innerHTML = '<section class="loading-content svelte-1ao9gz5"><div class="loading-spinner svelte-1ao9gz5"><div class="svelte-1ao9gz5"></div> \n            <div class="svelte-1ao9gz5"></div> \n            <div class="svelte-1ao9gz5"></div> \n            <div class="svelte-1ao9gz5"></div> \n            <div class="svelte-1ao9gz5"></div> \n            <div class="svelte-1ao9gz5"></div> \n            <div class="svelte-1ao9gz5"></div> \n            <div class="svelte-1ao9gz5"></div> \n            <div class="svelte-1ao9gz5"></div> \n            <div class="svelte-1ao9gz5"></div> \n            <div class="svelte-1ao9gz5"></div> \n            <div class="svelte-1ao9gz5"></div></div></section>', h(e, "class", "loading-container svelte-1ao9gz5") }, m(t, n) { f(t, e, n) }, p: t, i: t, o: t, d(t) { t && d(e) } } }
    class qt extends D { constructor(t) { super(), J(this, t, null, Xt, o, {}) } }

    function Ht(n) {
        let e, s, c, o, r, a;
        return {
            c() {
                var t, i, l, u;
                e = p("section"), s = p("section"), c = p("i"), o = g(), r = p("strong"), a = m(n[0]), h(c, "class", "start-icon fa fa-info-circle faa-shake animated fa-2x"), h(r, "class", "font__weight-bold"), t = r, i = "font-size", null === (l = "0.69vw") ? t.style.removeProperty(i) : t.style.setProperty(i, l, u ? "important" : ""), h(s, "class", "notificaion-content svelte-aywcjm"), h(e, "class", "notificaion-container svelte-aywcjm")
            },
            m(t, n) { f(t, e, n), u(e, s), u(s, c), u(s, o), u(s, r), u(r, a) },
            p(t, [n]) { 1 & n && b(a, t[0]) },
            i: t,
            o: t,
            d(t) { t && d(e) }
        }
    }

    function Jt(t, n, e) { let s; return i(t, st, (t => e(0, s = t))), [s] }
    class Dt extends D { constructor(t) { super(), J(this, t, Jt, Ht, o, {}) } }

    function Gt(t) { let n, e; return n = new Wt({}), { c() { W(n.$$.fragment) }, m(t, s) { X(n, t, s), e = !0 }, i(t) { e || (Y(n.$$.fragment, t), e = !0) }, o(t) { F(n.$$.fragment, t), e = !1 }, d(t) { q(n, t) } } }

    function Kt(t) { let n, e; return n = new Dt({}), { c() { W(n.$$.fragment) }, m(t, s) { X(n, t, s), e = !0 }, i(t) { e || (Y(n.$$.fragment, t), e = !0) }, o(t) { F(n.$$.fragment, t), e = !1 }, d(t) { q(n, t) } } }

    function Qt(t) {
        let n, e, s, c, o;
        n = new Yt({});
        let r = "" !== t[0].actionType && Gt(),
            a = "" !== t[1] && Kt();
        return { c() { W(n.$$.fragment), e = g(), r && r.c(), s = g(), a && a.c(), c = v() }, m(t, i) { X(n, t, i), f(t, e, i), r && r.m(t, i), f(t, s, i), a && a.m(t, i), f(t, c, i), o = !0 }, p(t, n) { "" !== t[0].actionType ? r ? 1 & n && Y(r, 1) : (r = Gt(), r.c(), Y(r, 1), r.m(s.parentNode, s)) : r && (B(), F(r, 1, 1, (() => { r = null })), I()), "" !== t[1] ? a ? 2 & n && Y(a, 1) : (a = Kt(), a.c(), Y(a, 1), a.m(c.parentNode, c)) : a && (B(), F(a, 1, 1, (() => { a = null })), I()) }, i(t) { o || (Y(n.$$.fragment, t), Y(r), Y(a), o = !0) }, o(t) { F(n.$$.fragment, t), F(r), F(a), o = !1 }, d(t) { q(n, t), t && d(e), r && r.d(t), t && d(s), a && a.d(t), t && d(c) } }
    }

    function tn(t) { let n, e; return n = new qt({}), { c() { W(n.$$.fragment) }, m(t, s) { X(n, t, s), e = !0 }, i(t) { e || (Y(n.$$.fragment, t), e = !0) }, o(t) { F(n.$$.fragment, t), e = !1 }, d(t) { q(n, t) } } }

    function nn(t) {
        let n, e, s, c, o, r;
        s = new pt({ props: { $$slots: { default: [Qt] }, $$scope: { ctx: t } } });
        let a = t[2] && tn();
        return {
            c() { n = p("link"), e = g(), W(s.$$.fragment), c = g(), a && a.c(), o = v(), h(n, "rel", "stylesheet"), h(n, "href", "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"), h(n, "integrity", "sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="), h(n, "crossorigin", "anonymous"), h(n, "referrerpolicy", "no-referrer") },
            m(t, i) { u(document.head, n), f(t, e, i), X(s, t, i), f(t, c, i), a && a.m(t, i), f(t, o, i), r = !0 },
            p(t, [n]) {
                const e = {};
                11 & n && (e.$$scope = { dirty: n, ctx: t }), s.$set(e), t[2] ? a ? 4 & n && Y(a, 1) : (a = tn(), a.c(), Y(a, 1), a.m(o.parentNode, o)) : a && (B(), F(a, 1, 1, (() => { a = null })), I())
            },
            i(t) { r || (Y(s.$$.fragment, t), Y(a), r = !0) },
            o(t) { F(s.$$.fragment, t), F(a), r = !1 },
            d(t) { d(n), t && d(e), q(s, t), t && d(c), a && a.d(t), t && d(o) }
        }
    }

    function en(t, n, e) { let s, c, o; return i(t, rt, (t => e(0, s = t))), i(t, st, (t => e(1, c = t))), i(t, et, (t => e(2, o = t))), gt([{ action: "setVisible", data: !0 }]), [s, c, o] }
    return new class extends D { constructor(t) { super(), J(this, t, en, nn, o, {}) } }({ target: document.body })
}();
//# sourceMappingURL=bundle.js.map