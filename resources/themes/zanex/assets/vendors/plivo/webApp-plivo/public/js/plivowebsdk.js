/* Name: JsSIP Maintainer: José Luis Millán <jmillan@aliax.net> Copyright (c) 2012-2016 José Luis Millán <jmillan@aliax.net> License: The MIT License Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.*/
/*Copyright (c) 2013-2016, callstats.io All rights reserved.THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.*/
/***
Copyright (c) 2013-2018, callstats.io
All rights reserved.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
***/

/*! callstats  version = 3.50.3 2018-05-30 01-17-11 */

!function() {
    function a(b, c, d) {
        function e(g, h) {
            if (!c[g]) {
                if (!b[g]) {
                    var i = "function" == typeof require && require;
                    if (!h && i) return i(g, !0);
                    if (f) return f(g, !0);
                    var j = new Error("Cannot find module '" + g + "'");
                    throw j.code = "MODULE_NOT_FOUND", j;
                }
                var k = c[g] = {
                    exports: {}
                };
                b[g][0].call(k.exports, function(a) {
                    return e(b[g][1][a] || a);
                }, k, k.exports, a, b, c, d);
            }
            return c[g].exports;
        }
        for (var f = "function" == typeof require && require, g = 0; g < d.length; g++) e(d[g]);
        return e;
    }
    return a;
}()({
    1: [ function(a, b, c) {
        (function(a, d) {
            !function(a) {
                if ("object" == typeof c && void 0 !== b) b.exports = a(); else if ("function" == typeof define && define.amd) define([], a); else {
                    var e;
                    "undefined" != typeof window ? e = window : void 0 !== d ? e = d : "undefined" != typeof self && (e = self), 
                    e.Promise = a();
                }
            }(function() {
                var b, c, e;
                return function a(b, c, d) {
                    function e(g, h) {
                        if (!c[g]) {
                            if (!b[g]) {
                                var i = "function" == typeof _dereq_ && _dereq_;
                                if (!h && i) return i(g, !0);
                                if (f) return f(g, !0);
                                var j = new Error("Cannot find module '" + g + "'");
                                throw j.code = "MODULE_NOT_FOUND", j;
                            }
                            var k = c[g] = {
                                exports: {}
                            };
                            b[g][0].call(k.exports, function(a) {
                                var c = b[g][1][a];
                                return e(c || a);
                            }, k, k.exports, a, b, c, d);
                        }
                        return c[g].exports;
                    }
                    for (var f = "function" == typeof _dereq_ && _dereq_, g = 0; g < d.length; g++) e(d[g]);
                    return e;
                }({
                    1: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(a) {
                            function b(a) {
                                var b = new c(a), d = b.promise();
                                return b.setHowMany(1), b.setUnwrap(), b.init(), d;
                            }
                            var c = a._SomePromiseArray;
                            a.any = function(a) {
                                return b(a);
                            }, a.prototype.any = function() {
                                return b(this);
                            };
                        };
                    }, {} ],
                    2: [ function(b, c, d) {
                        "use strict";
                        function e() {
                            this._customScheduler = !1, this._isTickUsed = !1, this._lateQueue = new k(16), 
                            this._normalQueue = new k(16), this._haveDrainedQueues = !1, this._trampolineEnabled = !0;
                            var a = this;
                            this.drainQueues = function() {
                                a._drainQueues();
                            }, this._schedule = j;
                        }
                        function f(a, b, c) {
                            this._lateQueue.push(a, b, c), this._queueTick();
                        }
                        function g(a, b, c) {
                            this._normalQueue.push(a, b, c), this._queueTick();
                        }
                        function h(a) {
                            this._normalQueue._pushOne(a), this._queueTick();
                        }
                        var i;
                        try {
                            throw new Error();
                        } catch (a) {
                            i = a;
                        }
                        var j = b("./schedule"), k = b("./queue"), l = b("./util");
                        e.prototype.setScheduler = function(a) {
                            var b = this._schedule;
                            return this._schedule = a, this._customScheduler = !0, b;
                        }, e.prototype.hasCustomScheduler = function() {
                            return this._customScheduler;
                        }, e.prototype.enableTrampoline = function() {
                            this._trampolineEnabled = !0;
                        }, e.prototype.disableTrampolineIfNecessary = function() {
                            l.hasDevTools && (this._trampolineEnabled = !1);
                        }, e.prototype.haveItemsQueued = function() {
                            return this._isTickUsed || this._haveDrainedQueues;
                        }, e.prototype.fatalError = function(b, c) {
                            c ? (a.stderr.write("Fatal " + (b instanceof Error ? b.stack : b) + "\n"), a.exit(2)) : this.throwLater(b);
                        }, e.prototype.throwLater = function(a, b) {
                            if (1 === arguments.length && (b = a, a = function() {
                                throw b;
                            }), "undefined" != typeof setTimeout) setTimeout(function() {
                                a(b);
                            }, 0); else try {
                                this._schedule(function() {
                                    a(b);
                                });
                            } catch (a) {
                                throw new Error("No async scheduler available\n\n    See http://goo.gl/MqrFmX\n");
                            }
                        }, l.hasDevTools ? (e.prototype.invokeLater = function(a, b, c) {
                            this._trampolineEnabled ? f.call(this, a, b, c) : this._schedule(function() {
                                setTimeout(function() {
                                    a.call(b, c);
                                }, 100);
                            });
                        }, e.prototype.invoke = function(a, b, c) {
                            this._trampolineEnabled ? g.call(this, a, b, c) : this._schedule(function() {
                                a.call(b, c);
                            });
                        }, e.prototype.settlePromises = function(a) {
                            this._trampolineEnabled ? h.call(this, a) : this._schedule(function() {
                                a._settlePromises();
                            });
                        }) : (e.prototype.invokeLater = f, e.prototype.invoke = g, e.prototype.settlePromises = h), 
                        e.prototype._drainQueue = function(a) {
                            for (;a.length() > 0; ) {
                                var b = a.shift();
                                if ("function" == typeof b) {
                                    var c = a.shift(), d = a.shift();
                                    b.call(c, d);
                                } else b._settlePromises();
                            }
                        }, e.prototype._drainQueues = function() {
                            this._drainQueue(this._normalQueue), this._reset(), this._haveDrainedQueues = !0, 
                            this._drainQueue(this._lateQueue);
                        }, e.prototype._queueTick = function() {
                            this._isTickUsed || (this._isTickUsed = !0, this._schedule(this.drainQueues));
                        }, e.prototype._reset = function() {
                            this._isTickUsed = !1;
                        }, c.exports = e, c.exports.firstLineError = i;
                    }, {
                        "./queue": 26,
                        "./schedule": 29,
                        "./util": 36
                    } ],
                    3: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(a, b, c, d) {
                            var e = !1, f = function(a, b) {
                                this._reject(b);
                            }, g = function(a, b) {
                                b.promiseRejectionQueued = !0, b.bindingPromise._then(f, f, null, this, a);
                            }, h = function(a, b) {
                                0 == (50397184 & this._bitField) && this._resolveCallback(b.target);
                            }, i = function(a, b) {
                                b.promiseRejectionQueued || this._reject(a);
                            };
                            a.prototype.bind = function(f) {
                                e || (e = !0, a.prototype._propagateFrom = d.propagateFromFunction(), a.prototype._boundValue = d.boundValueFunction());
                                var j = c(f), k = new a(b);
                                k._propagateFrom(this, 1);
                                var l = this._target();
                                if (k._setBoundTo(j), j instanceof a) {
                                    var m = {
                                        promiseRejectionQueued: !1,
                                        promise: k,
                                        target: l,
                                        bindingPromise: j
                                    };
                                    l._then(b, g, void 0, k, m), j._then(h, i, void 0, k, m), k._setOnCancel(j);
                                } else k._resolveCallback(l);
                                return k;
                            }, a.prototype._setBoundTo = function(a) {
                                void 0 !== a ? (this._bitField = 2097152 | this._bitField, this._boundTo = a) : this._bitField = -2097153 & this._bitField;
                            }, a.prototype._isBound = function() {
                                return 2097152 == (2097152 & this._bitField);
                            }, a.bind = function(b, c) {
                                return a.resolve(c).bind(b);
                            };
                        };
                    }, {} ],
                    4: [ function(a, b, c) {
                        "use strict";
                        function d() {
                            try {
                                Promise === f && (Promise = e);
                            } catch (a) {}
                            return f;
                        }
                        var e;
                        "undefined" != typeof Promise && (e = Promise);
                        var f = a("./promise")();
                        f.noConflict = d, b.exports = f;
                    }, {
                        "./promise": 22
                    } ],
                    5: [ function(a, b, c) {
                        "use strict";
                        var d = Object.create;
                        if (d) {
                            var e = d(null), f = d(null);
                            e[" size"] = f[" size"] = 0;
                        }
                        b.exports = function(b) {
                            function c(a, c) {
                                var d;
                                if (null != a && (d = a[c]), "function" != typeof d) {
                                    var e = "Object " + h.classString(a) + " has no method '" + h.toString(c) + "'";
                                    throw new b.TypeError(e);
                                }
                                return d;
                            }
                            function d(a) {
                                return c(a, this.pop()).apply(a, this);
                            }
                            function e(a) {
                                return a[this];
                            }
                            function f(a) {
                                var b = +this;
                                return b < 0 && (b = Math.max(0, b + a.length)), a[b];
                            }
                            var g, h = a("./util"), i = h.canEvaluate;
                            h.isIdentifier;
                            b.prototype.call = function(a) {
                                var b = [].slice.call(arguments, 1);
                                return b.push(a), this._then(d, void 0, void 0, b, void 0);
                            }, b.prototype.get = function(a) {
                                var b, c = "number" == typeof a;
                                if (c) b = f; else if (i) {
                                    var d = g(a);
                                    b = null !== d ? d : e;
                                } else b = e;
                                return this._then(b, void 0, void 0, a, void 0);
                            };
                        };
                    }, {
                        "./util": 36
                    } ],
                    6: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d, e) {
                            var f = a("./util"), g = f.tryCatch, h = f.errorObj, i = b._async;
                            b.prototype.break = b.prototype.cancel = function() {
                                if (!e.cancellation()) return this._warn("cancellation is disabled");
                                for (var a = this, b = a; a._isCancellable(); ) {
                                    if (!a._cancelBy(b)) {
                                        b._isFollowing() ? b._followee().cancel() : b._cancelBranched();
                                        break;
                                    }
                                    var c = a._cancellationParent;
                                    if (null == c || !c._isCancellable()) {
                                        a._isFollowing() ? a._followee().cancel() : a._cancelBranched();
                                        break;
                                    }
                                    a._isFollowing() && a._followee().cancel(), a._setWillBeCancelled(), b = a, a = c;
                                }
                            }, b.prototype._branchHasCancelled = function() {
                                this._branchesRemainingToCancel--;
                            }, b.prototype._enoughBranchesHaveCancelled = function() {
                                return void 0 === this._branchesRemainingToCancel || this._branchesRemainingToCancel <= 0;
                            }, b.prototype._cancelBy = function(a) {
                                return a === this ? (this._branchesRemainingToCancel = 0, this._invokeOnCancel(), 
                                !0) : (this._branchHasCancelled(), !!this._enoughBranchesHaveCancelled() && (this._invokeOnCancel(), 
                                !0));
                            }, b.prototype._cancelBranched = function() {
                                this._enoughBranchesHaveCancelled() && this._cancel();
                            }, b.prototype._cancel = function() {
                                this._isCancellable() && (this._setCancelled(), i.invoke(this._cancelPromises, this, void 0));
                            }, b.prototype._cancelPromises = function() {
                                this._length() > 0 && this._settlePromises();
                            }, b.prototype._unsetOnCancel = function() {
                                this._onCancelField = void 0;
                            }, b.prototype._isCancellable = function() {
                                return this.isPending() && !this._isCancelled();
                            }, b.prototype.isCancellable = function() {
                                return this.isPending() && !this.isCancelled();
                            }, b.prototype._doInvokeOnCancel = function(a, b) {
                                if (f.isArray(a)) for (var c = 0; c < a.length; ++c) this._doInvokeOnCancel(a[c], b); else if (void 0 !== a) if ("function" == typeof a) {
                                    if (!b) {
                                        var d = g(a).call(this._boundValue());
                                        d === h && (this._attachExtraTrace(d.e), i.throwLater(d.e));
                                    }
                                } else a._resultCancelled(this);
                            }, b.prototype._invokeOnCancel = function() {
                                var a = this._onCancel();
                                this._unsetOnCancel(), i.invoke(this._doInvokeOnCancel, this, a);
                            }, b.prototype._invokeInternalOnCancel = function() {
                                this._isCancellable() && (this._doInvokeOnCancel(this._onCancel(), !0), this._unsetOnCancel());
                            }, b.prototype._resultCancelled = function() {
                                this.cancel();
                            };
                        };
                    }, {
                        "./util": 36
                    } ],
                    7: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b) {
                            function c(a, c, h) {
                                return function(i) {
                                    var j = h._boundValue();
                                    a: for (var k = 0; k < a.length; ++k) {
                                        var l = a[k];
                                        if (l === Error || null != l && l.prototype instanceof Error) {
                                            if (i instanceof l) return f(c).call(j, i);
                                        } else if ("function" == typeof l) {
                                            var m = f(l).call(j, i);
                                            if (m === g) return m;
                                            if (m) return f(c).call(j, i);
                                        } else if (d.isObject(i)) {
                                            for (var n = e(l), o = 0; o < n.length; ++o) {
                                                var p = n[o];
                                                if (l[p] != i[p]) continue a;
                                            }
                                            return f(c).call(j, i);
                                        }
                                    }
                                    return b;
                                };
                            }
                            var d = a("./util"), e = a("./es5").keys, f = d.tryCatch, g = d.errorObj;
                            return c;
                        };
                    }, {
                        "./es5": 13,
                        "./util": 36
                    } ],
                    8: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(a) {
                            function b() {
                                this._trace = new b.CapturedTrace(d());
                            }
                            function c() {
                                if (e) return new b();
                            }
                            function d() {
                                var a = f.length - 1;
                                if (a >= 0) return f[a];
                            }
                            var e = !1, f = [];
                            return a.prototype._promiseCreated = function() {}, a.prototype._pushContext = function() {}, 
                            a.prototype._popContext = function() {
                                return null;
                            }, a._peekContext = a.prototype._peekContext = function() {}, b.prototype._pushContext = function() {
                                void 0 !== this._trace && (this._trace._promiseCreated = null, f.push(this._trace));
                            }, b.prototype._popContext = function() {
                                if (void 0 !== this._trace) {
                                    var a = f.pop(), b = a._promiseCreated;
                                    return a._promiseCreated = null, b;
                                }
                                return null;
                            }, b.CapturedTrace = null, b.create = c, b.deactivateLongStackTraces = function() {}, 
                            b.activateLongStackTraces = function() {
                                var c = a.prototype._pushContext, f = a.prototype._popContext, g = a._peekContext, h = a.prototype._peekContext, i = a.prototype._promiseCreated;
                                b.deactivateLongStackTraces = function() {
                                    a.prototype._pushContext = c, a.prototype._popContext = f, a._peekContext = g, a.prototype._peekContext = h, 
                                    a.prototype._promiseCreated = i, e = !1;
                                }, e = !0, a.prototype._pushContext = b.prototype._pushContext, a.prototype._popContext = b.prototype._popContext, 
                                a._peekContext = a.prototype._peekContext = d, a.prototype._promiseCreated = function() {
                                    var a = this._peekContext();
                                    a && null == a._promiseCreated && (a._promiseCreated = this);
                                };
                            }, b;
                        };
                    }, {} ],
                    9: [ function(b, c, d) {
                        "use strict";
                        c.exports = function(c, d) {
                            function e(a, b) {
                                return {
                                    promise: b
                                };
                            }
                            function f() {
                                return !1;
                            }
                            function g(a, b, c) {
                                var d = this;
                                try {
                                    a(b, c, function(a) {
                                        if ("function" != typeof a) throw new TypeError("onCancel must be a function, got: " + N.toString(a));
                                        d._attachCancellationCallback(a);
                                    });
                                } catch (a) {
                                    return a;
                                }
                            }
                            function h(a) {
                                if (!this._isCancellable()) return this;
                                var b = this._onCancel();
                                void 0 !== b ? N.isArray(b) ? b.push(a) : this._setOnCancel([ b, a ]) : this._setOnCancel(a);
                            }
                            function i() {
                                return this._onCancelField;
                            }
                            function j(a) {
                                this._onCancelField = a;
                            }
                            function k() {
                                this._cancellationParent = void 0, this._onCancelField = void 0;
                            }
                            function l(a, b) {
                                if (0 != (1 & b)) {
                                    this._cancellationParent = a;
                                    var c = a._branchesRemainingToCancel;
                                    void 0 === c && (c = 0), a._branchesRemainingToCancel = c + 1;
                                }
                                0 != (2 & b) && a._isBound() && this._setBoundTo(a._boundTo);
                            }
                            function m(a, b) {
                                0 != (2 & b) && a._isBound() && this._setBoundTo(a._boundTo);
                            }
                            function n() {
                                var a = this._boundTo;
                                return void 0 !== a && a instanceof c ? a.isFulfilled() ? a.value() : void 0 : a;
                            }
                            function o() {
                                this._trace = new G(this._peekContext());
                            }
                            function p(a, b) {
                                if (O(a)) {
                                    var c = this._trace;
                                    if (void 0 !== c && b && (c = c._parent), void 0 !== c) c.attachExtraTrace(a); else if (!a.__stackCleaned__) {
                                        var d = y(a);
                                        N.notEnumerableProp(a, "stack", d.message + "\n" + d.stack.join("\n")), N.notEnumerableProp(a, "__stackCleaned__", !0);
                                    }
                                }
                            }
                            function q(a, b, c, d, e) {
                                if (void 0 === a && null !== b && Y) {
                                    if (void 0 !== e && e._returnedNonUndefined()) return;
                                    if (0 == (65535 & d._bitField)) return;
                                    c && (c += " ");
                                    var f = "", g = "";
                                    if (b._trace) {
                                        for (var h = b._trace.stack.split("\n"), i = w(h), j = i.length - 1; j >= 0; --j) {
                                            var k = i[j];
                                            if (!Q.test(k)) {
                                                var l = k.match(R);
                                                l && (f = "at " + l[1] + ":" + l[2] + ":" + l[3] + " ");
                                                break;
                                            }
                                        }
                                        if (i.length > 0) for (var m = i[0], j = 0; j < h.length; ++j) if (h[j] === m) {
                                            j > 0 && (g = "\n" + h[j - 1]);
                                            break;
                                        }
                                    }
                                    var n = "a promise was created in a " + c + "handler " + f + "but was not returned from it, see http://goo.gl/rRqMUw" + g;
                                    d._warn(n, !0, b);
                                }
                            }
                            function r(a, b) {
                                var c = a + " is deprecated and will be removed in a future version.";
                                return b && (c += " Use " + b + " instead."), s(c);
                            }
                            function s(a, b, d) {
                                if (ga.warnings) {
                                    var e, f = new M(a);
                                    if (b) d._attachExtraTrace(f); else if (ga.longStackTraces && (e = c._peekContext())) e.attachExtraTrace(f); else {
                                        var g = y(f);
                                        f.stack = g.message + "\n" + g.stack.join("\n");
                                    }
                                    ba("warning", f) || z(f, "", !0);
                                }
                            }
                            function t(a, b) {
                                for (var c = 0; c < b.length - 1; ++c) b[c].push("From previous event:"), b[c] = b[c].join("\n");
                                return c < b.length && (b[c] = b[c].join("\n")), a + "\n" + b.join("\n");
                            }
                            function u(a) {
                                for (var b = 0; b < a.length; ++b) (0 === a[b].length || b + 1 < a.length && a[b][0] === a[b + 1][0]) && (a.splice(b, 1), 
                                b--);
                            }
                            function v(a) {
                                for (var b = a[0], c = 1; c < a.length; ++c) {
                                    for (var d = a[c], e = b.length - 1, f = b[e], g = -1, h = d.length - 1; h >= 0; --h) if (d[h] === f) {
                                        g = h;
                                        break;
                                    }
                                    for (var h = g; h >= 0; --h) {
                                        var i = d[h];
                                        if (b[e] !== i) break;
                                        b.pop(), e--;
                                    }
                                    b = d;
                                }
                            }
                            function w(a) {
                                for (var b = [], c = 0; c < a.length; ++c) {
                                    var d = a[c], e = "    (No stack trace)" === d || S.test(d), f = e && da(d);
                                    e && !f && (U && " " !== d.charAt(0) && (d = "    " + d), b.push(d));
                                }
                                return b;
                            }
                            function x(a) {
                                for (var b = a.stack.replace(/\s+$/g, "").split("\n"), c = 0; c < b.length; ++c) {
                                    var d = b[c];
                                    if ("    (No stack trace)" === d || S.test(d)) break;
                                }
                                return c > 0 && "SyntaxError" != a.name && (b = b.slice(c)), b;
                            }
                            function y(a) {
                                var b = a.stack, c = a.toString();
                                return b = "string" == typeof b && b.length > 0 ? x(a) : [ "    (No stack trace)" ], 
                                {
                                    message: c,
                                    stack: "SyntaxError" == a.name ? b : w(b)
                                };
                            }
                            function z(a, b, c) {
                                if ("undefined" != typeof console) {
                                    var d;
                                    if (N.isObject(a)) {
                                        var e = a.stack;
                                        d = b + T(e, a);
                                    } else d = b + String(a);
                                    "function" == typeof J ? J(d, c) : "function" != typeof console.log && "object" != typeof console.log || console.log(d);
                                }
                            }
                            function A(a, b, c, d) {
                                var e = !1;
                                try {
                                    "function" == typeof b && (e = !0, "rejectionHandled" === a ? b(d) : b(c, d));
                                } catch (a) {
                                    L.throwLater(a);
                                }
                                "unhandledRejection" === a ? ba(a, c, d) || e || z(c, "Unhandled rejection ") : ba(a, d);
                            }
                            function B(a) {
                                var b;
                                if ("function" == typeof a) b = "[function " + (a.name || "anonymous") + "]"; else {
                                    b = a && "function" == typeof a.toString ? a.toString() : N.toString(a);
                                    if (/\[object [a-zA-Z0-9$_]+\]/.test(b)) try {
                                        b = JSON.stringify(a);
                                    } catch (a) {}
                                    0 === b.length && (b = "(empty array)");
                                }
                                return "(<" + C(b) + ">, no stack trace)";
                            }
                            function C(a) {
                                return a.length < 41 ? a : a.substr(0, 38) + "...";
                            }
                            function D() {
                                return "function" == typeof fa;
                            }
                            function E(a) {
                                var b = a.match(ea);
                                if (b) return {
                                    fileName: b[1],
                                    line: parseInt(b[2], 10)
                                };
                            }
                            function F(a, b) {
                                if (D()) {
                                    for (var c, d, e = a.stack.split("\n"), f = b.stack.split("\n"), g = -1, h = -1, i = 0; i < e.length; ++i) {
                                        var j = E(e[i]);
                                        if (j) {
                                            c = j.fileName, g = j.line;
                                            break;
                                        }
                                    }
                                    for (var i = 0; i < f.length; ++i) {
                                        var j = E(f[i]);
                                        if (j) {
                                            d = j.fileName, h = j.line;
                                            break;
                                        }
                                    }
                                    g < 0 || h < 0 || !c || !d || c !== d || g >= h || (da = function(a) {
                                        if (P.test(a)) return !0;
                                        var b = E(a);
                                        return !!(b && b.fileName === c && g <= b.line && b.line <= h);
                                    });
                                }
                            }
                            function G(a) {
                                this._parent = a, this._promisesCreated = 0;
                                var b = this._length = 1 + (void 0 === a ? 0 : a._length);
                                fa(this, G), b > 32 && this.uncycle();
                            }
                            var H, I, J, K = c._getDomain, L = c._async, M = b("./errors").Warning, N = b("./util"), O = N.canAttachTrace, P = /[\\\/]bluebird[\\\/]js[\\\/](release|debug|instrumented)/, Q = /\((?:timers\.js):\d+:\d+\)/, R = /[\/<\(](.+?):(\d+):(\d+)\)?\s*$/, S = null, T = null, U = !1, V = !(0 == N.env("BLUEBIRD_DEBUG")), W = !(0 == N.env("BLUEBIRD_WARNINGS") || !V && !N.env("BLUEBIRD_WARNINGS")), X = !(0 == N.env("BLUEBIRD_LONG_STACK_TRACES") || !V && !N.env("BLUEBIRD_LONG_STACK_TRACES")), Y = 0 != N.env("BLUEBIRD_W_FORGOTTEN_RETURN") && (W || !!N.env("BLUEBIRD_W_FORGOTTEN_RETURN"));
                            c.prototype.suppressUnhandledRejections = function() {
                                var a = this._target();
                                a._bitField = -1048577 & a._bitField | 524288;
                            }, c.prototype._ensurePossibleRejectionHandled = function() {
                                if (0 == (524288 & this._bitField)) {
                                    this._setRejectionIsUnhandled();
                                    var a = this;
                                    setTimeout(function() {
                                        a._notifyUnhandledRejection();
                                    }, 1);
                                }
                            }, c.prototype._notifyUnhandledRejectionIsHandled = function() {
                                A("rejectionHandled", H, void 0, this);
                            }, c.prototype._setReturnedNonUndefined = function() {
                                this._bitField = 268435456 | this._bitField;
                            }, c.prototype._returnedNonUndefined = function() {
                                return 0 != (268435456 & this._bitField);
                            }, c.prototype._notifyUnhandledRejection = function() {
                                if (this._isRejectionUnhandled()) {
                                    var a = this._settledValue();
                                    this._setUnhandledRejectionIsNotified(), A("unhandledRejection", I, a, this);
                                }
                            }, c.prototype._setUnhandledRejectionIsNotified = function() {
                                this._bitField = 262144 | this._bitField;
                            }, c.prototype._unsetUnhandledRejectionIsNotified = function() {
                                this._bitField = -262145 & this._bitField;
                            }, c.prototype._isUnhandledRejectionNotified = function() {
                                return (262144 & this._bitField) > 0;
                            }, c.prototype._setRejectionIsUnhandled = function() {
                                this._bitField = 1048576 | this._bitField;
                            }, c.prototype._unsetRejectionIsUnhandled = function() {
                                this._bitField = -1048577 & this._bitField, this._isUnhandledRejectionNotified() && (this._unsetUnhandledRejectionIsNotified(), 
                                this._notifyUnhandledRejectionIsHandled());
                            }, c.prototype._isRejectionUnhandled = function() {
                                return (1048576 & this._bitField) > 0;
                            }, c.prototype._warn = function(a, b, c) {
                                return s(a, b, c || this);
                            }, c.onPossiblyUnhandledRejection = function(a) {
                                var b = K();
                                I = "function" == typeof a ? null === b ? a : N.domainBind(b, a) : void 0;
                            }, c.onUnhandledRejectionHandled = function(a) {
                                var b = K();
                                H = "function" == typeof a ? null === b ? a : N.domainBind(b, a) : void 0;
                            };
                            var Z = function() {};
                            c.longStackTraces = function() {
                                if (L.haveItemsQueued() && !ga.longStackTraces) throw new Error("cannot enable long stack traces after promises have been created\n\n    See http://goo.gl/MqrFmX\n");
                                if (!ga.longStackTraces && D()) {
                                    var a = c.prototype._captureStackTrace, b = c.prototype._attachExtraTrace;
                                    ga.longStackTraces = !0, Z = function() {
                                        if (L.haveItemsQueued() && !ga.longStackTraces) throw new Error("cannot enable long stack traces after promises have been created\n\n    See http://goo.gl/MqrFmX\n");
                                        c.prototype._captureStackTrace = a, c.prototype._attachExtraTrace = b, d.deactivateLongStackTraces(), 
                                        L.enableTrampoline(), ga.longStackTraces = !1;
                                    }, c.prototype._captureStackTrace = o, c.prototype._attachExtraTrace = p, d.activateLongStackTraces(), 
                                    L.disableTrampolineIfNecessary();
                                }
                            }, c.hasLongStackTraces = function() {
                                return ga.longStackTraces && D();
                            };
                            var $ = function() {
                                try {
                                    if ("function" == typeof CustomEvent) {
                                        var a = new CustomEvent("CustomEvent");
                                        return N.global.dispatchEvent(a), function(a, b) {
                                            var c = new CustomEvent(a.toLowerCase(), {
                                                detail: b,
                                                cancelable: !0
                                            });
                                            return !N.global.dispatchEvent(c);
                                        };
                                    }
                                    if ("function" == typeof Event) {
                                        var a = new Event("CustomEvent");
                                        return N.global.dispatchEvent(a), function(a, b) {
                                            var c = new Event(a.toLowerCase(), {
                                                cancelable: !0
                                            });
                                            return c.detail = b, !N.global.dispatchEvent(c);
                                        };
                                    }
                                    var a = document.createEvent("CustomEvent");
                                    return a.initCustomEvent("testingtheevent", !1, !0, {}), N.global.dispatchEvent(a), 
                                    function(a, b) {
                                        var c = document.createEvent("CustomEvent");
                                        return c.initCustomEvent(a.toLowerCase(), !1, !0, b), !N.global.dispatchEvent(c);
                                    };
                                } catch (a) {}
                                return function() {
                                    return !1;
                                };
                            }(), _ = function() {
                                return N.isNode ? function() {
                                    return a.emit.apply(a, arguments);
                                } : N.global ? function(a) {
                                    var b = "on" + a.toLowerCase(), c = N.global[b];
                                    return !!c && (c.apply(N.global, [].slice.call(arguments, 1)), !0);
                                } : function() {
                                    return !1;
                                };
                            }(), aa = {
                                promiseCreated: e,
                                promiseFulfilled: e,
                                promiseRejected: e,
                                promiseResolved: e,
                                promiseCancelled: e,
                                promiseChained: function(a, b, c) {
                                    return {
                                        promise: b,
                                        child: c
                                    };
                                },
                                warning: function(a, b) {
                                    return {
                                        warning: b
                                    };
                                },
                                unhandledRejection: function(a, b, c) {
                                    return {
                                        reason: b,
                                        promise: c
                                    };
                                },
                                rejectionHandled: e
                            }, ba = function(a) {
                                var b = !1;
                                try {
                                    b = _.apply(null, arguments);
                                } catch (a) {
                                    L.throwLater(a), b = !0;
                                }
                                var c = !1;
                                try {
                                    c = $(a, aa[a].apply(null, arguments));
                                } catch (a) {
                                    L.throwLater(a), c = !0;
                                }
                                return c || b;
                            };
                            c.config = function(a) {
                                if (a = Object(a), "longStackTraces" in a && (a.longStackTraces ? c.longStackTraces() : !a.longStackTraces && c.hasLongStackTraces() && Z()), 
                                "warnings" in a) {
                                    var b = a.warnings;
                                    ga.warnings = !!b, Y = ga.warnings, N.isObject(b) && "wForgottenReturn" in b && (Y = !!b.wForgottenReturn);
                                }
                                if ("cancellation" in a && a.cancellation && !ga.cancellation) {
                                    if (L.haveItemsQueued()) throw new Error("cannot enable cancellation after promises are in use");
                                    c.prototype._clearCancellationData = k, c.prototype._propagateFrom = l, c.prototype._onCancel = i, 
                                    c.prototype._setOnCancel = j, c.prototype._attachCancellationCallback = h, c.prototype._execute = g, 
                                    ca = l, ga.cancellation = !0;
                                }
                                return "monitoring" in a && (a.monitoring && !ga.monitoring ? (ga.monitoring = !0, 
                                c.prototype._fireEvent = ba) : !a.monitoring && ga.monitoring && (ga.monitoring = !1, 
                                c.prototype._fireEvent = f)), c;
                            }, c.prototype._fireEvent = f, c.prototype._execute = function(a, b, c) {
                                try {
                                    a(b, c);
                                } catch (a) {
                                    return a;
                                }
                            }, c.prototype._onCancel = function() {}, c.prototype._setOnCancel = function(a) {}, 
                            c.prototype._attachCancellationCallback = function(a) {}, c.prototype._captureStackTrace = function() {}, 
                            c.prototype._attachExtraTrace = function() {}, c.prototype._clearCancellationData = function() {}, 
                            c.prototype._propagateFrom = function(a, b) {};
                            var ca = m, da = function() {
                                return !1;
                            }, ea = /[\/<\(]([^:\/]+):(\d+):(?:\d+)\)?\s*$/;
                            N.inherits(G, Error), d.CapturedTrace = G, G.prototype.uncycle = function() {
                                var a = this._length;
                                if (!(a < 2)) {
                                    for (var b = [], c = {}, d = 0, e = this; void 0 !== e; ++d) b.push(e), e = e._parent;
                                    a = this._length = d;
                                    for (var d = a - 1; d >= 0; --d) {
                                        var f = b[d].stack;
                                        void 0 === c[f] && (c[f] = d);
                                    }
                                    for (var d = 0; d < a; ++d) {
                                        var g = b[d].stack, h = c[g];
                                        if (void 0 !== h && h !== d) {
                                            h > 0 && (b[h - 1]._parent = void 0, b[h - 1]._length = 1), b[d]._parent = void 0, 
                                            b[d]._length = 1;
                                            var i = d > 0 ? b[d - 1] : this;
                                            h < a - 1 ? (i._parent = b[h + 1], i._parent.uncycle(), i._length = i._parent._length + 1) : (i._parent = void 0, 
                                            i._length = 1);
                                            for (var j = i._length + 1, k = d - 2; k >= 0; --k) b[k]._length = j, j++;
                                            return;
                                        }
                                    }
                                }
                            }, G.prototype.attachExtraTrace = function(a) {
                                if (!a.__stackCleaned__) {
                                    this.uncycle();
                                    for (var b = y(a), c = b.message, d = [ b.stack ], e = this; void 0 !== e; ) d.push(w(e.stack.split("\n"))), 
                                    e = e._parent;
                                    v(d), u(d), N.notEnumerableProp(a, "stack", t(c, d)), N.notEnumerableProp(a, "__stackCleaned__", !0);
                                }
                            };
                            var fa = function() {
                                var a = /^\s*at\s*/, b = function(a, b) {
                                    return "string" == typeof a ? a : void 0 !== b.name && void 0 !== b.message ? b.toString() : B(b);
                                };
                                if ("number" == typeof Error.stackTraceLimit && "function" == typeof Error.captureStackTrace) {
                                    Error.stackTraceLimit += 6, S = a, T = b;
                                    var c = Error.captureStackTrace;
                                    return da = function(a) {
                                        return P.test(a);
                                    }, function(a, b) {
                                        Error.stackTraceLimit += 6, c(a, b), Error.stackTraceLimit -= 6;
                                    };
                                }
                                var d = new Error();
                                if ("string" == typeof d.stack && d.stack.split("\n")[0].indexOf("stackDetection@") >= 0) return S = /@/, 
                                T = b, U = !0, function(a) {
                                    a.stack = new Error().stack;
                                };
                                var e;
                                try {
                                    throw new Error();
                                } catch (a) {
                                    e = "stack" in a;
                                }
                                return "stack" in d || !e || "number" != typeof Error.stackTraceLimit ? (T = function(a, b) {
                                    return "string" == typeof a ? a : "object" != typeof b && "function" != typeof b || void 0 === b.name || void 0 === b.message ? B(b) : b.toString();
                                }, null) : (S = a, T = b, function(a) {
                                    Error.stackTraceLimit += 6;
                                    try {
                                        throw new Error();
                                    } catch (b) {
                                        a.stack = b.stack;
                                    }
                                    Error.stackTraceLimit -= 6;
                                });
                            }();
                            "undefined" != typeof console && void 0 !== console.warn && (J = function(a) {
                                console.warn(a);
                            }, N.isNode && a.stderr.isTTY ? J = function(a, b) {
                                var c = b ? "[33m" : "[31m";
                                console.warn(c + a + "[0m\n");
                            } : N.isNode || "string" != typeof new Error().stack || (J = function(a, b) {
                                console.warn("%c" + a, b ? "color: darkorange" : "color: red");
                            }));
                            var ga = {
                                warnings: W,
                                longStackTraces: !1,
                                cancellation: !1,
                                monitoring: !1
                            };
                            return X && c.longStackTraces(), {
                                longStackTraces: function() {
                                    return ga.longStackTraces;
                                },
                                warnings: function() {
                                    return ga.warnings;
                                },
                                cancellation: function() {
                                    return ga.cancellation;
                                },
                                monitoring: function() {
                                    return ga.monitoring;
                                },
                                propagateFromFunction: function() {
                                    return ca;
                                },
                                boundValueFunction: function() {
                                    return n;
                                },
                                checkForgottenReturns: q,
                                setBounds: F,
                                warn: s,
                                deprecated: r,
                                CapturedTrace: G,
                                fireDomEvent: $,
                                fireGlobalEvent: _
                            };
                        };
                    }, {
                        "./errors": 12,
                        "./util": 36
                    } ],
                    10: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(a) {
                            function b() {
                                return this.value;
                            }
                            function c() {
                                throw this.reason;
                            }
                            a.prototype.return = a.prototype.thenReturn = function(c) {
                                return c instanceof a && c.suppressUnhandledRejections(), this._then(b, void 0, void 0, {
                                    value: c
                                }, void 0);
                            }, a.prototype.throw = a.prototype.thenThrow = function(a) {
                                return this._then(c, void 0, void 0, {
                                    reason: a
                                }, void 0);
                            }, a.prototype.catchThrow = function(a) {
                                if (arguments.length <= 1) return this._then(void 0, c, void 0, {
                                    reason: a
                                }, void 0);
                                var b = arguments[1], d = function() {
                                    throw b;
                                };
                                return this.caught(a, d);
                            }, a.prototype.catchReturn = function(c) {
                                if (arguments.length <= 1) return c instanceof a && c.suppressUnhandledRejections(), 
                                this._then(void 0, b, void 0, {
                                    value: c
                                }, void 0);
                                var d = arguments[1];
                                d instanceof a && d.suppressUnhandledRejections();
                                var e = function() {
                                    return d;
                                };
                                return this.caught(c, e);
                            };
                        };
                    }, {} ],
                    11: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(a, b) {
                            function c() {
                                return f(this);
                            }
                            function d(a, c) {
                                return e(a, c, b, b);
                            }
                            var e = a.reduce, f = a.all;
                            a.prototype.each = function(a) {
                                return e(this, a, b, 0)._then(c, void 0, void 0, this, void 0);
                            }, a.prototype.mapSeries = function(a) {
                                return e(this, a, b, b);
                            }, a.each = function(a, d) {
                                return e(a, d, b, 0)._then(c, void 0, void 0, a, void 0);
                            }, a.mapSeries = d;
                        };
                    }, {} ],
                    12: [ function(a, b, c) {
                        "use strict";
                        function d(a, b) {
                            function c(d) {
                                if (!(this instanceof c)) return new c(d);
                                l(this, "message", "string" == typeof d ? d : b), l(this, "name", a), Error.captureStackTrace ? Error.captureStackTrace(this, this.constructor) : Error.call(this);
                            }
                            return k(c, Error), c;
                        }
                        function e(a) {
                            if (!(this instanceof e)) return new e(a);
                            l(this, "name", "OperationalError"), l(this, "message", a), this.cause = a, this.isOperational = !0, 
                            a instanceof Error ? (l(this, "message", a.message), l(this, "stack", a.stack)) : Error.captureStackTrace && Error.captureStackTrace(this, this.constructor);
                        }
                        var f, g, h = a("./es5"), i = h.freeze, j = a("./util"), k = j.inherits, l = j.notEnumerableProp, m = d("Warning", "warning"), n = d("CancellationError", "cancellation error"), o = d("TimeoutError", "timeout error"), p = d("AggregateError", "aggregate error");
                        try {
                            f = TypeError, g = RangeError;
                        } catch (a) {
                            f = d("TypeError", "type error"), g = d("RangeError", "range error");
                        }
                        for (var q = "join pop push shift unshift slice filter forEach some every map indexOf lastIndexOf reduce reduceRight sort reverse".split(" "), r = 0; r < q.length; ++r) "function" == typeof Array.prototype[q[r]] && (p.prototype[q[r]] = Array.prototype[q[r]]);
                        h.defineProperty(p.prototype, "length", {
                            value: 0,
                            configurable: !1,
                            writable: !0,
                            enumerable: !0
                        }), p.prototype.isOperational = !0;
                        var s = 0;
                        p.prototype.toString = function() {
                            var a = Array(4 * s + 1).join(" "), b = "\n" + a + "AggregateError of:\n";
                            s++, a = Array(4 * s + 1).join(" ");
                            for (var c = 0; c < this.length; ++c) {
                                for (var d = this[c] === this ? "[Circular AggregateError]" : this[c] + "", e = d.split("\n"), f = 0; f < e.length; ++f) e[f] = a + e[f];
                                d = e.join("\n"), b += d + "\n";
                            }
                            return s--, b;
                        }, k(e, Error);
                        var t = Error.__BluebirdErrorTypes__;
                        t || (t = i({
                            CancellationError: n,
                            TimeoutError: o,
                            OperationalError: e,
                            RejectionError: e,
                            AggregateError: p
                        }), h.defineProperty(Error, "__BluebirdErrorTypes__", {
                            value: t,
                            writable: !1,
                            enumerable: !1,
                            configurable: !1
                        })), b.exports = {
                            Error: Error,
                            TypeError: f,
                            RangeError: g,
                            CancellationError: t.CancellationError,
                            OperationalError: t.OperationalError,
                            TimeoutError: t.TimeoutError,
                            AggregateError: t.AggregateError,
                            Warning: m
                        };
                    }, {
                        "./es5": 13,
                        "./util": 36
                    } ],
                    13: [ function(a, b, c) {
                        var d = function() {
                            "use strict";
                            return void 0 === this;
                        }();
                        if (d) b.exports = {
                            freeze: Object.freeze,
                            defineProperty: Object.defineProperty,
                            getDescriptor: Object.getOwnPropertyDescriptor,
                            keys: Object.keys,
                            names: Object.getOwnPropertyNames,
                            getPrototypeOf: Object.getPrototypeOf,
                            isArray: Array.isArray,
                            isES5: d,
                            propertyIsWritable: function(a, b) {
                                var c = Object.getOwnPropertyDescriptor(a, b);
                                return !(c && !c.writable && !c.set);
                            }
                        }; else {
                            var e = {}.hasOwnProperty, f = {}.toString, g = {}.constructor.prototype, h = function(a) {
                                var b = [];
                                for (var c in a) e.call(a, c) && b.push(c);
                                return b;
                            }, i = function(a, b) {
                                return {
                                    value: a[b]
                                };
                            }, j = function(a, b, c) {
                                return a[b] = c.value, a;
                            }, k = function(a) {
                                return a;
                            }, l = function(a) {
                                try {
                                    return Object(a).constructor.prototype;
                                } catch (a) {
                                    return g;
                                }
                            }, m = function(a) {
                                try {
                                    return "[object Array]" === f.call(a);
                                } catch (a) {
                                    return !1;
                                }
                            };
                            b.exports = {
                                isArray: m,
                                keys: h,
                                names: h,
                                defineProperty: j,
                                getDescriptor: i,
                                freeze: k,
                                getPrototypeOf: l,
                                isES5: d,
                                propertyIsWritable: function() {
                                    return !0;
                                }
                            };
                        }
                    }, {} ],
                    14: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(a, b) {
                            var c = a.map;
                            a.prototype.filter = function(a, d) {
                                return c(this, a, d, b);
                            }, a.filter = function(a, d, e) {
                                return c(a, d, e, b);
                            };
                        };
                    }, {} ],
                    15: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d) {
                            function e(a, b, c) {
                                this.promise = a, this.type = b, this.handler = c, this.called = !1, this.cancelPromise = null;
                            }
                            function f(a) {
                                this.finallyHandler = a;
                            }
                            function g(a, b) {
                                return null != a.cancelPromise && (arguments.length > 1 ? a.cancelPromise._reject(b) : a.cancelPromise._cancel(), 
                                a.cancelPromise = null, !0);
                            }
                            function h() {
                                return j.call(this, this.promise._target()._settledValue());
                            }
                            function i(a) {
                                if (!g(this, a)) return m.e = a, m;
                            }
                            function j(a) {
                                var e = this.promise, j = this.handler;
                                if (!this.called) {
                                    this.called = !0;
                                    var k = this.isFinallyHandler() ? j.call(e._boundValue()) : j.call(e._boundValue(), a);
                                    if (k === d) return k;
                                    if (void 0 !== k) {
                                        e._setReturnedNonUndefined();
                                        var n = c(k, e);
                                        if (n instanceof b) {
                                            if (null != this.cancelPromise) {
                                                if (n._isCancelled()) {
                                                    var o = new l("late cancellation observer");
                                                    return e._attachExtraTrace(o), m.e = o, m;
                                                }
                                                n.isPending() && n._attachCancellationCallback(new f(this));
                                            }
                                            return n._then(h, i, void 0, this, void 0);
                                        }
                                    }
                                }
                                return e.isRejected() ? (g(this), m.e = a, m) : (g(this), a);
                            }
                            var k = a("./util"), l = b.CancellationError, m = k.errorObj, n = a("./catch_filter")(d);
                            return e.prototype.isFinallyHandler = function() {
                                return 0 === this.type;
                            }, f.prototype._resultCancelled = function() {
                                g(this.finallyHandler);
                            }, b.prototype._passThrough = function(a, b, c, d) {
                                return "function" != typeof a ? this.then() : this._then(c, d, void 0, new e(this, b, a), void 0);
                            }, b.prototype.lastly = b.prototype.finally = function(a) {
                                return this._passThrough(a, 0, j, j);
                            }, b.prototype.tap = function(a) {
                                return this._passThrough(a, 1, j);
                            }, b.prototype.tapCatch = function(a) {
                                var c = arguments.length;
                                if (1 === c) return this._passThrough(a, 1, void 0, j);
                                var d, e = new Array(c - 1), f = 0;
                                for (d = 0; d < c - 1; ++d) {
                                    var g = arguments[d];
                                    if (!k.isObject(g)) return b.reject(new TypeError("tapCatch statement predicate: expecting an object but got " + k.classString(g)));
                                    e[f++] = g;
                                }
                                e.length = f;
                                var h = arguments[d];
                                return this._passThrough(n(e, h, this), 1, void 0, j);
                            }, e;
                        };
                    }, {
                        "./catch_filter": 7,
                        "./util": 36
                    } ],
                    16: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d, e, f, g) {
                            function h(a, c, d) {
                                for (var f = 0; f < c.length; ++f) {
                                    d._pushContext();
                                    var g = n(c[f])(a);
                                    if (d._popContext(), g === m) {
                                        d._pushContext();
                                        var h = b.reject(m.e);
                                        return d._popContext(), h;
                                    }
                                    var i = e(g, d);
                                    if (i instanceof b) return i;
                                }
                                return null;
                            }
                            function i(a, c, e, f) {
                                if (g.cancellation()) {
                                    var h = new b(d), i = this._finallyPromise = new b(d);
                                    this._promise = h.lastly(function() {
                                        return i;
                                    }), h._captureStackTrace(), h._setOnCancel(this);
                                } else {
                                    (this._promise = new b(d))._captureStackTrace();
                                }
                                this._stack = f, this._generatorFunction = a, this._receiver = c, this._generator = void 0, 
                                this._yieldHandlers = "function" == typeof e ? [ e ].concat(o) : o, this._yieldedPromise = null, 
                                this._cancellationPhase = !1;
                            }
                            var j = a("./errors"), k = j.TypeError, l = a("./util"), m = l.errorObj, n = l.tryCatch, o = [];
                            l.inherits(i, f), i.prototype._isResolved = function() {
                                return null === this._promise;
                            }, i.prototype._cleanup = function() {
                                this._promise = this._generator = null, g.cancellation() && null !== this._finallyPromise && (this._finallyPromise._fulfill(), 
                                this._finallyPromise = null);
                            }, i.prototype._promiseCancelled = function() {
                                if (!this._isResolved()) {
                                    var a, c = void 0 !== this._generator.return;
                                    if (c) this._promise._pushContext(), a = n(this._generator.return).call(this._generator, void 0), 
                                    this._promise._popContext(); else {
                                        var d = new b.CancellationError("generator .return() sentinel");
                                        b.coroutine.returnSentinel = d, this._promise._attachExtraTrace(d), this._promise._pushContext(), 
                                        a = n(this._generator.throw).call(this._generator, d), this._promise._popContext();
                                    }
                                    this._cancellationPhase = !0, this._yieldedPromise = null, this._continue(a);
                                }
                            }, i.prototype._promiseFulfilled = function(a) {
                                this._yieldedPromise = null, this._promise._pushContext();
                                var b = n(this._generator.next).call(this._generator, a);
                                this._promise._popContext(), this._continue(b);
                            }, i.prototype._promiseRejected = function(a) {
                                this._yieldedPromise = null, this._promise._attachExtraTrace(a), this._promise._pushContext();
                                var b = n(this._generator.throw).call(this._generator, a);
                                this._promise._popContext(), this._continue(b);
                            }, i.prototype._resultCancelled = function() {
                                if (this._yieldedPromise instanceof b) {
                                    var a = this._yieldedPromise;
                                    this._yieldedPromise = null, a.cancel();
                                }
                            }, i.prototype.promise = function() {
                                return this._promise;
                            }, i.prototype._run = function() {
                                this._generator = this._generatorFunction.call(this._receiver), this._receiver = this._generatorFunction = void 0, 
                                this._promiseFulfilled(void 0);
                            }, i.prototype._continue = function(a) {
                                var c = this._promise;
                                if (a === m) return this._cleanup(), this._cancellationPhase ? c.cancel() : c._rejectCallback(a.e, !1);
                                var d = a.value;
                                if (!0 === a.done) return this._cleanup(), this._cancellationPhase ? c.cancel() : c._resolveCallback(d);
                                var f = e(d, this._promise);
                                if (!(f instanceof b) && null === (f = h(f, this._yieldHandlers, this._promise))) return void this._promiseRejected(new k("A value %s was yielded that could not be treated as a promise\n\n    See http://goo.gl/MqrFmX\n\n".replace("%s", String(d)) + "From coroutine:\n" + this._stack.split("\n").slice(1, -7).join("\n")));
                                f = f._target();
                                var g = f._bitField;
                                0 == (50397184 & g) ? (this._yieldedPromise = f, f._proxy(this, null)) : 0 != (33554432 & g) ? b._async.invoke(this._promiseFulfilled, this, f._value()) : 0 != (16777216 & g) ? b._async.invoke(this._promiseRejected, this, f._reason()) : this._promiseCancelled();
                            }, b.coroutine = function(a, b) {
                                if ("function" != typeof a) throw new k("generatorFunction must be a function\n\n    See http://goo.gl/MqrFmX\n");
                                var c = Object(b).yieldHandler, d = i, e = new Error().stack;
                                return function() {
                                    var b = a.apply(this, arguments), f = new d(void 0, void 0, c, e), g = f.promise();
                                    return f._generator = b, f._promiseFulfilled(void 0), g;
                                };
                            }, b.coroutine.addYieldHandler = function(a) {
                                if ("function" != typeof a) throw new k("expecting a function but got " + l.classString(a));
                                o.push(a);
                            }, b.spawn = function(a) {
                                if (g.deprecated("Promise.spawn()", "Promise.coroutine()"), "function" != typeof a) return c("generatorFunction must be a function\n\n    See http://goo.gl/MqrFmX\n");
                                var d = new i(a, this), e = d.promise();
                                return d._run(b.spawn), e;
                            };
                        };
                    }, {
                        "./errors": 12,
                        "./util": 36
                    } ],
                    17: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d, e, f, g) {
                            var h = a("./util");
                            h.canEvaluate, h.tryCatch, h.errorObj;
                            b.join = function() {
                                var a, b = arguments.length - 1;
                                if (b > 0 && "function" == typeof arguments[b]) {
                                    a = arguments[b];
                                    var d;
                                }
                                var e = [].slice.call(arguments);
                                a && e.pop();
                                var d = new c(e).promise();
                                return void 0 !== a ? d.spread(a) : d;
                            };
                        };
                    }, {
                        "./util": 36
                    } ],
                    18: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d, e, f, g) {
                            function h(a, b, c, d) {
                                this.constructor$(a), this._promise._captureStackTrace();
                                var e = j();
                                this._callback = null === e ? b : k.domainBind(e, b), this._preservedValues = d === f ? new Array(this.length()) : null, 
                                this._limit = c, this._inFlight = 0, this._queue = [], n.invoke(this._asyncInit, this, void 0);
                            }
                            function i(a, c, e, f) {
                                if ("function" != typeof c) return d("expecting a function but got " + k.classString(c));
                                var g = 0;
                                if (void 0 !== e) {
                                    if ("object" != typeof e || null === e) return b.reject(new TypeError("options argument must be an object but it is " + k.classString(e)));
                                    if ("number" != typeof e.concurrency) return b.reject(new TypeError("'concurrency' must be a number but it is " + k.classString(e.concurrency)));
                                    g = e.concurrency;
                                }
                                return g = "number" == typeof g && isFinite(g) && g >= 1 ? g : 0, new h(a, c, g, f).promise();
                            }
                            var j = b._getDomain, k = a("./util"), l = k.tryCatch, m = k.errorObj, n = b._async;
                            k.inherits(h, c), h.prototype._asyncInit = function() {
                                this._init$(void 0, -2);
                            }, h.prototype._init = function() {}, h.prototype._promiseFulfilled = function(a, c) {
                                var d = this._values, f = this.length(), h = this._preservedValues, i = this._limit;
                                if (c < 0) {
                                    if (c = -1 * c - 1, d[c] = a, i >= 1 && (this._inFlight--, this._drainQueue(), this._isResolved())) return !0;
                                } else {
                                    if (i >= 1 && this._inFlight >= i) return d[c] = a, this._queue.push(c), !1;
                                    null !== h && (h[c] = a);
                                    var j = this._promise, k = this._callback, n = j._boundValue();
                                    j._pushContext();
                                    var o = l(k).call(n, a, c, f), p = j._popContext();
                                    if (g.checkForgottenReturns(o, p, null !== h ? "Promise.filter" : "Promise.map", j), 
                                    o === m) return this._reject(o.e), !0;
                                    var q = e(o, this._promise);
                                    if (q instanceof b) {
                                        q = q._target();
                                        var r = q._bitField;
                                        if (0 == (50397184 & r)) return i >= 1 && this._inFlight++, d[c] = q, q._proxy(this, -1 * (c + 1)), 
                                        !1;
                                        if (0 == (33554432 & r)) return 0 != (16777216 & r) ? (this._reject(q._reason()), 
                                        !0) : (this._cancel(), !0);
                                        o = q._value();
                                    }
                                    d[c] = o;
                                }
                                return ++this._totalResolved >= f && (null !== h ? this._filter(d, h) : this._resolve(d), 
                                !0);
                            }, h.prototype._drainQueue = function() {
                                for (var a = this._queue, b = this._limit, c = this._values; a.length > 0 && this._inFlight < b; ) {
                                    if (this._isResolved()) return;
                                    var d = a.pop();
                                    this._promiseFulfilled(c[d], d);
                                }
                            }, h.prototype._filter = function(a, b) {
                                for (var c = b.length, d = new Array(c), e = 0, f = 0; f < c; ++f) a[f] && (d[e++] = b[f]);
                                d.length = e, this._resolve(d);
                            }, h.prototype.preservedValues = function() {
                                return this._preservedValues;
                            }, b.prototype.map = function(a, b) {
                                return i(this, a, b, null);
                            }, b.map = function(a, b, c, d) {
                                return i(a, b, c, d);
                            };
                        };
                    }, {
                        "./util": 36
                    } ],
                    19: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d, e, f) {
                            var g = a("./util"), h = g.tryCatch;
                            b.method = function(a) {
                                if ("function" != typeof a) throw new b.TypeError("expecting a function but got " + g.classString(a));
                                return function() {
                                    var d = new b(c);
                                    d._captureStackTrace(), d._pushContext();
                                    var e = h(a).apply(this, arguments), g = d._popContext();
                                    return f.checkForgottenReturns(e, g, "Promise.method", d), d._resolveFromSyncValue(e), 
                                    d;
                                };
                            }, b.attempt = b.try = function(a) {
                                if ("function" != typeof a) return e("expecting a function but got " + g.classString(a));
                                var d = new b(c);
                                d._captureStackTrace(), d._pushContext();
                                var i;
                                if (arguments.length > 1) {
                                    f.deprecated("calling Promise.try with more than 1 argument");
                                    var j = arguments[1], k = arguments[2];
                                    i = g.isArray(j) ? h(a).apply(k, j) : h(a).call(k, j);
                                } else i = h(a)();
                                var l = d._popContext();
                                return f.checkForgottenReturns(i, l, "Promise.try", d), d._resolveFromSyncValue(i), 
                                d;
                            }, b.prototype._resolveFromSyncValue = function(a) {
                                a === g.errorObj ? this._rejectCallback(a.e, !1) : this._resolveCallback(a, !0);
                            };
                        };
                    }, {
                        "./util": 36
                    } ],
                    20: [ function(a, b, c) {
                        "use strict";
                        function d(a) {
                            return a instanceof Error && k.getPrototypeOf(a) === Error.prototype;
                        }
                        function e(a) {
                            var b;
                            if (d(a)) {
                                b = new j(a), b.name = a.name, b.message = a.message, b.stack = a.stack;
                                for (var c = k.keys(a), e = 0; e < c.length; ++e) {
                                    var f = c[e];
                                    l.test(f) || (b[f] = a[f]);
                                }
                                return b;
                            }
                            return g.markAsOriginatingFromRejection(a), a;
                        }
                        function f(a, b) {
                            return function(c, d) {
                                if (null !== a) {
                                    if (c) {
                                        var f = e(h(c));
                                        a._attachExtraTrace(f), a._reject(f);
                                    } else if (b) {
                                        var g = [].slice.call(arguments, 1);
                                        a._fulfill(g);
                                    } else a._fulfill(d);
                                    a = null;
                                }
                            };
                        }
                        var g = a("./util"), h = g.maybeWrapAsError, i = a("./errors"), j = i.OperationalError, k = a("./es5"), l = /^(?:name|message|stack|cause)$/;
                        b.exports = f;
                    }, {
                        "./errors": 12,
                        "./es5": 13,
                        "./util": 36
                    } ],
                    21: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b) {
                            function c(a, b) {
                                var c = this;
                                if (!f.isArray(a)) return d.call(c, a, b);
                                var e = h(b).apply(c._boundValue(), [ null ].concat(a));
                                e === i && g.throwLater(e.e);
                            }
                            function d(a, b) {
                                var c = this, d = c._boundValue(), e = void 0 === a ? h(b).call(d, null) : h(b).call(d, null, a);
                                e === i && g.throwLater(e.e);
                            }
                            function e(a, b) {
                                var c = this;
                                if (!a) {
                                    var d = new Error(a + "");
                                    d.cause = a, a = d;
                                }
                                var e = h(b).call(c._boundValue(), a);
                                e === i && g.throwLater(e.e);
                            }
                            var f = a("./util"), g = b._async, h = f.tryCatch, i = f.errorObj;
                            b.prototype.asCallback = b.prototype.nodeify = function(a, b) {
                                if ("function" == typeof a) {
                                    var f = d;
                                    void 0 !== b && Object(b).spread && (f = c), this._then(f, e, void 0, this, a);
                                }
                                return this;
                            };
                        };
                    }, {
                        "./util": 36
                    } ],
                    22: [ function(b, c, d) {
                        "use strict";
                        c.exports = function() {
                            function d() {}
                            function e(a, b) {
                                if (null == a || a.constructor !== f) throw new t("the promise constructor cannot be invoked directly\n\n    See http://goo.gl/MqrFmX\n");
                                if ("function" != typeof b) throw new t("expecting a function but got " + o.classString(b));
                            }
                            function f(a) {
                                a !== v && e(this, a), this._bitField = 0, this._fulfillmentHandler0 = void 0, this._rejectionHandler0 = void 0, 
                                this._promise0 = void 0, this._receiver0 = void 0, this._resolveFromExecutor(a), 
                                this._promiseCreated(), this._fireEvent("promiseCreated", this);
                            }
                            function g(a) {
                                this.promise._resolveCallback(a);
                            }
                            function h(a) {
                                this.promise._rejectCallback(a, !1);
                            }
                            function i(a) {
                                var b = new f(v);
                                b._fulfillmentHandler0 = a, b._rejectionHandler0 = a, b._promise0 = a, b._receiver0 = a;
                            }
                            var j, k = function() {
                                return new t("circular promise resolution chain\n\n    See http://goo.gl/MqrFmX\n");
                            }, l = function() {
                                return new f.PromiseInspection(this._target());
                            }, m = function(a) {
                                return f.reject(new t(a));
                            }, n = {}, o = b("./util");
                            j = o.isNode ? function() {
                                var b = a.domain;
                                return void 0 === b && (b = null), b;
                            } : function() {
                                return null;
                            }, o.notEnumerableProp(f, "_getDomain", j);
                            var p = b("./es5"), q = b("./async"), r = new q();
                            p.defineProperty(f, "_async", {
                                value: r
                            });
                            var s = b("./errors"), t = f.TypeError = s.TypeError;
                            f.RangeError = s.RangeError;
                            var u = f.CancellationError = s.CancellationError;
                            f.TimeoutError = s.TimeoutError, f.OperationalError = s.OperationalError, f.RejectionError = s.OperationalError, 
                            f.AggregateError = s.AggregateError;
                            var v = function() {}, w = {}, x = {}, y = b("./thenables")(f, v), z = b("./promise_array")(f, v, y, m, d), A = b("./context")(f), B = A.create, C = b("./debuggability")(f, A), D = (C.CapturedTrace, 
                            b("./finally")(f, y, x)), E = b("./catch_filter")(x), F = b("./nodeback"), G = o.errorObj, H = o.tryCatch;
                            return f.prototype.toString = function() {
                                return "[object Promise]";
                            }, f.prototype.caught = f.prototype.catch = function(a) {
                                var b = arguments.length;
                                if (b > 1) {
                                    var c, d = new Array(b - 1), e = 0;
                                    for (c = 0; c < b - 1; ++c) {
                                        var f = arguments[c];
                                        if (!o.isObject(f)) return m("Catch statement predicate: expecting an object but got " + o.classString(f));
                                        d[e++] = f;
                                    }
                                    return d.length = e, a = arguments[c], this.then(void 0, E(d, a, this));
                                }
                                return this.then(void 0, a);
                            }, f.prototype.reflect = function() {
                                return this._then(l, l, void 0, this, void 0);
                            }, f.prototype.then = function(a, b) {
                                if (C.warnings() && arguments.length > 0 && "function" != typeof a && "function" != typeof b) {
                                    var c = ".then() only accepts functions but was passed: " + o.classString(a);
                                    arguments.length > 1 && (c += ", " + o.classString(b)), this._warn(c);
                                }
                                return this._then(a, b, void 0, void 0, void 0);
                            }, f.prototype.done = function(a, b) {
                                this._then(a, b, void 0, void 0, void 0)._setIsFinal();
                            }, f.prototype.spread = function(a) {
                                return "function" != typeof a ? m("expecting a function but got " + o.classString(a)) : this.all()._then(a, void 0, void 0, w, void 0);
                            }, f.prototype.toJSON = function() {
                                var a = {
                                    isFulfilled: !1,
                                    isRejected: !1,
                                    fulfillmentValue: void 0,
                                    rejectionReason: void 0
                                };
                                return this.isFulfilled() ? (a.fulfillmentValue = this.value(), a.isFulfilled = !0) : this.isRejected() && (a.rejectionReason = this.reason(), 
                                a.isRejected = !0), a;
                            }, f.prototype.all = function() {
                                return arguments.length > 0 && this._warn(".all() was passed arguments but it does not take any"), 
                                new z(this).promise();
                            }, f.prototype.error = function(a) {
                                return this.caught(o.originatesFromRejection, a);
                            }, f.getNewLibraryCopy = c.exports, f.is = function(a) {
                                return a instanceof f;
                            }, f.fromNode = f.fromCallback = function(a) {
                                var b = new f(v);
                                b._captureStackTrace();
                                var c = arguments.length > 1 && !!Object(arguments[1]).multiArgs, d = H(a)(F(b, c));
                                return d === G && b._rejectCallback(d.e, !0), b._isFateSealed() || b._setAsyncGuaranteed(), 
                                b;
                            }, f.all = function(a) {
                                return new z(a).promise();
                            }, f.cast = function(a) {
                                var b = y(a);
                                return b instanceof f || (b = new f(v), b._captureStackTrace(), b._setFulfilled(), 
                                b._rejectionHandler0 = a), b;
                            }, f.resolve = f.fulfilled = f.cast, f.reject = f.rejected = function(a) {
                                var b = new f(v);
                                return b._captureStackTrace(), b._rejectCallback(a, !0), b;
                            }, f.setScheduler = function(a) {
                                if ("function" != typeof a) throw new t("expecting a function but got " + o.classString(a));
                                return r.setScheduler(a);
                            }, f.prototype._then = function(a, b, c, d, e) {
                                var g = void 0 !== e, h = g ? e : new f(v), i = this._target(), k = i._bitField;
                                g || (h._propagateFrom(this, 3), h._captureStackTrace(), void 0 === d && 0 != (2097152 & this._bitField) && (d = 0 != (50397184 & k) ? this._boundValue() : i === this ? void 0 : this._boundTo), 
                                this._fireEvent("promiseChained", this, h));
                                var l = j();
                                if (0 != (50397184 & k)) {
                                    var m, n, p = i._settlePromiseCtx;
                                    0 != (33554432 & k) ? (n = i._rejectionHandler0, m = a) : 0 != (16777216 & k) ? (n = i._fulfillmentHandler0, 
                                    m = b, i._unsetRejectionIsUnhandled()) : (p = i._settlePromiseLateCancellationObserver, 
                                    n = new u("late cancellation observer"), i._attachExtraTrace(n), m = b), r.invoke(p, i, {
                                        handler: null === l ? m : "function" == typeof m && o.domainBind(l, m),
                                        promise: h,
                                        receiver: d,
                                        value: n
                                    });
                                } else i._addCallbacks(a, b, h, d, l);
                                return h;
                            }, f.prototype._length = function() {
                                return 65535 & this._bitField;
                            }, f.prototype._isFateSealed = function() {
                                return 0 != (117506048 & this._bitField);
                            }, f.prototype._isFollowing = function() {
                                return 67108864 == (67108864 & this._bitField);
                            }, f.prototype._setLength = function(a) {
                                this._bitField = -65536 & this._bitField | 65535 & a;
                            }, f.prototype._setFulfilled = function() {
                                this._bitField = 33554432 | this._bitField, this._fireEvent("promiseFulfilled", this);
                            }, f.prototype._setRejected = function() {
                                this._bitField = 16777216 | this._bitField, this._fireEvent("promiseRejected", this);
                            }, f.prototype._setFollowing = function() {
                                this._bitField = 67108864 | this._bitField, this._fireEvent("promiseResolved", this);
                            }, f.prototype._setIsFinal = function() {
                                this._bitField = 4194304 | this._bitField;
                            }, f.prototype._isFinal = function() {
                                return (4194304 & this._bitField) > 0;
                            }, f.prototype._unsetCancelled = function() {
                                this._bitField = -65537 & this._bitField;
                            }, f.prototype._setCancelled = function() {
                                this._bitField = 65536 | this._bitField, this._fireEvent("promiseCancelled", this);
                            }, f.prototype._setWillBeCancelled = function() {
                                this._bitField = 8388608 | this._bitField;
                            }, f.prototype._setAsyncGuaranteed = function() {
                                r.hasCustomScheduler() || (this._bitField = 134217728 | this._bitField);
                            }, f.prototype._receiverAt = function(a) {
                                var b = 0 === a ? this._receiver0 : this[4 * a - 4 + 3];
                                if (b !== n) return void 0 === b && this._isBound() ? this._boundValue() : b;
                            }, f.prototype._promiseAt = function(a) {
                                return this[4 * a - 4 + 2];
                            }, f.prototype._fulfillmentHandlerAt = function(a) {
                                return this[4 * a - 4 + 0];
                            }, f.prototype._rejectionHandlerAt = function(a) {
                                return this[4 * a - 4 + 1];
                            }, f.prototype._boundValue = function() {}, f.prototype._migrateCallback0 = function(a) {
                                var b = (a._bitField, a._fulfillmentHandler0), c = a._rejectionHandler0, d = a._promise0, e = a._receiverAt(0);
                                void 0 === e && (e = n), this._addCallbacks(b, c, d, e, null);
                            }, f.prototype._migrateCallbackAt = function(a, b) {
                                var c = a._fulfillmentHandlerAt(b), d = a._rejectionHandlerAt(b), e = a._promiseAt(b), f = a._receiverAt(b);
                                void 0 === f && (f = n), this._addCallbacks(c, d, e, f, null);
                            }, f.prototype._addCallbacks = function(a, b, c, d, e) {
                                var f = this._length();
                                if (f >= 65531 && (f = 0, this._setLength(0)), 0 === f) this._promise0 = c, this._receiver0 = d, 
                                "function" == typeof a && (this._fulfillmentHandler0 = null === e ? a : o.domainBind(e, a)), 
                                "function" == typeof b && (this._rejectionHandler0 = null === e ? b : o.domainBind(e, b)); else {
                                    var g = 4 * f - 4;
                                    this[g + 2] = c, this[g + 3] = d, "function" == typeof a && (this[g + 0] = null === e ? a : o.domainBind(e, a)), 
                                    "function" == typeof b && (this[g + 1] = null === e ? b : o.domainBind(e, b));
                                }
                                return this._setLength(f + 1), f;
                            }, f.prototype._proxy = function(a, b) {
                                this._addCallbacks(void 0, void 0, b, a, null);
                            }, f.prototype._resolveCallback = function(a, b) {
                                if (0 == (117506048 & this._bitField)) {
                                    if (a === this) return this._rejectCallback(k(), !1);
                                    var c = y(a, this);
                                    if (!(c instanceof f)) return this._fulfill(a);
                                    b && this._propagateFrom(c, 2);
                                    var d = c._target();
                                    if (d === this) return void this._reject(k());
                                    var e = d._bitField;
                                    if (0 == (50397184 & e)) {
                                        var g = this._length();
                                        g > 0 && d._migrateCallback0(this);
                                        for (var h = 1; h < g; ++h) d._migrateCallbackAt(this, h);
                                        this._setFollowing(), this._setLength(0), this._setFollowee(d);
                                    } else if (0 != (33554432 & e)) this._fulfill(d._value()); else if (0 != (16777216 & e)) this._reject(d._reason()); else {
                                        var i = new u("late cancellation observer");
                                        d._attachExtraTrace(i), this._reject(i);
                                    }
                                }
                            }, f.prototype._rejectCallback = function(a, b, c) {
                                var d = o.ensureErrorObject(a), e = d === a;
                                if (!e && !c && C.warnings()) {
                                    var f = "a promise was rejected with a non-error: " + o.classString(a);
                                    this._warn(f, !0);
                                }
                                this._attachExtraTrace(d, !!b && e), this._reject(a);
                            }, f.prototype._resolveFromExecutor = function(a) {
                                if (a !== v) {
                                    var b = this;
                                    this._captureStackTrace(), this._pushContext();
                                    var c = !0, d = this._execute(a, function(a) {
                                        b._resolveCallback(a);
                                    }, function(a) {
                                        b._rejectCallback(a, c);
                                    });
                                    c = !1, this._popContext(), void 0 !== d && b._rejectCallback(d, !0);
                                }
                            }, f.prototype._settlePromiseFromHandler = function(a, b, c, d) {
                                var e = d._bitField;
                                if (0 == (65536 & e)) {
                                    d._pushContext();
                                    var f;
                                    b === w ? c && "number" == typeof c.length ? f = H(a).apply(this._boundValue(), c) : (f = G, 
                                    f.e = new t("cannot .spread() a non-array: " + o.classString(c))) : f = H(a).call(b, c);
                                    var g = d._popContext();
                                    e = d._bitField, 0 == (65536 & e) && (f === x ? d._reject(c) : f === G ? d._rejectCallback(f.e, !1) : (C.checkForgottenReturns(f, g, "", d, this), 
                                    d._resolveCallback(f)));
                                }
                            }, f.prototype._target = function() {
                                for (var a = this; a._isFollowing(); ) a = a._followee();
                                return a;
                            }, f.prototype._followee = function() {
                                return this._rejectionHandler0;
                            }, f.prototype._setFollowee = function(a) {
                                this._rejectionHandler0 = a;
                            }, f.prototype._settlePromise = function(a, b, c, e) {
                                var g = a instanceof f, h = this._bitField, i = 0 != (134217728 & h);
                                0 != (65536 & h) ? (g && a._invokeInternalOnCancel(), c instanceof D && c.isFinallyHandler() ? (c.cancelPromise = a, 
                                H(b).call(c, e) === G && a._reject(G.e)) : b === l ? a._fulfill(l.call(c)) : c instanceof d ? c._promiseCancelled(a) : g || a instanceof z ? a._cancel() : c.cancel()) : "function" == typeof b ? g ? (i && a._setAsyncGuaranteed(), 
                                this._settlePromiseFromHandler(b, c, e, a)) : b.call(c, e, a) : c instanceof d ? c._isResolved() || (0 != (33554432 & h) ? c._promiseFulfilled(e, a) : c._promiseRejected(e, a)) : g && (i && a._setAsyncGuaranteed(), 
                                0 != (33554432 & h) ? a._fulfill(e) : a._reject(e));
                            }, f.prototype._settlePromiseLateCancellationObserver = function(a) {
                                var b = a.handler, c = a.promise, d = a.receiver, e = a.value;
                                "function" == typeof b ? c instanceof f ? this._settlePromiseFromHandler(b, d, e, c) : b.call(d, e, c) : c instanceof f && c._reject(e);
                            }, f.prototype._settlePromiseCtx = function(a) {
                                this._settlePromise(a.promise, a.handler, a.receiver, a.value);
                            }, f.prototype._settlePromise0 = function(a, b, c) {
                                var d = this._promise0, e = this._receiverAt(0);
                                this._promise0 = void 0, this._receiver0 = void 0, this._settlePromise(d, a, e, b);
                            }, f.prototype._clearCallbackDataAtIndex = function(a) {
                                var b = 4 * a - 4;
                                this[b + 2] = this[b + 3] = this[b + 0] = this[b + 1] = void 0;
                            }, f.prototype._fulfill = function(a) {
                                var b = this._bitField;
                                if (!((117506048 & b) >>> 16)) {
                                    if (a === this) {
                                        var c = k();
                                        return this._attachExtraTrace(c), this._reject(c);
                                    }
                                    this._setFulfilled(), this._rejectionHandler0 = a, (65535 & b) > 0 && (0 != (134217728 & b) ? this._settlePromises() : r.settlePromises(this));
                                }
                            }, f.prototype._reject = function(a) {
                                var b = this._bitField;
                                if (!((117506048 & b) >>> 16)) {
                                    if (this._setRejected(), this._fulfillmentHandler0 = a, this._isFinal()) return r.fatalError(a, o.isNode);
                                    (65535 & b) > 0 ? r.settlePromises(this) : this._ensurePossibleRejectionHandled();
                                }
                            }, f.prototype._fulfillPromises = function(a, b) {
                                for (var c = 1; c < a; c++) {
                                    var d = this._fulfillmentHandlerAt(c), e = this._promiseAt(c), f = this._receiverAt(c);
                                    this._clearCallbackDataAtIndex(c), this._settlePromise(e, d, f, b);
                                }
                            }, f.prototype._rejectPromises = function(a, b) {
                                for (var c = 1; c < a; c++) {
                                    var d = this._rejectionHandlerAt(c), e = this._promiseAt(c), f = this._receiverAt(c);
                                    this._clearCallbackDataAtIndex(c), this._settlePromise(e, d, f, b);
                                }
                            }, f.prototype._settlePromises = function() {
                                var a = this._bitField, b = 65535 & a;
                                if (b > 0) {
                                    if (0 != (16842752 & a)) {
                                        var c = this._fulfillmentHandler0;
                                        this._settlePromise0(this._rejectionHandler0, c, a), this._rejectPromises(b, c);
                                    } else {
                                        var d = this._rejectionHandler0;
                                        this._settlePromise0(this._fulfillmentHandler0, d, a), this._fulfillPromises(b, d);
                                    }
                                    this._setLength(0);
                                }
                                this._clearCancellationData();
                            }, f.prototype._settledValue = function() {
                                var a = this._bitField;
                                return 0 != (33554432 & a) ? this._rejectionHandler0 : 0 != (16777216 & a) ? this._fulfillmentHandler0 : void 0;
                            }, f.defer = f.pending = function() {
                                return C.deprecated("Promise.defer", "new Promise"), {
                                    promise: new f(v),
                                    resolve: g,
                                    reject: h
                                };
                            }, o.notEnumerableProp(f, "_makeSelfResolutionError", k), b("./method")(f, v, y, m, C), 
                            b("./bind")(f, v, y, C), b("./cancel")(f, z, m, C), b("./direct_resolve")(f), b("./synchronous_inspection")(f), 
                            b("./join")(f, z, y, v, r, j), f.Promise = f, f.version = "3.5.1", b("./map.js")(f, z, m, y, v, C), 
                            b("./call_get.js")(f), b("./using.js")(f, m, y, B, v, C), b("./timers.js")(f, v, C), 
                            b("./generators.js")(f, m, v, y, d, C), b("./nodeify.js")(f), b("./promisify.js")(f, v), 
                            b("./props.js")(f, z, y, m), b("./race.js")(f, v, y, m), b("./reduce.js")(f, z, m, y, v, C), 
                            b("./settle.js")(f, z, C), b("./some.js")(f, z, m), b("./filter.js")(f, v), b("./each.js")(f, v), 
                            b("./any.js")(f), o.toFastProperties(f), o.toFastProperties(f.prototype), i({
                                a: 1
                            }), i({
                                b: 2
                            }), i({
                                c: 3
                            }), i(1), i(function() {}), i(void 0), i(!1), i(new f(v)), C.setBounds(q.firstLineError, o.lastLineError), 
                            f;
                        };
                    }, {
                        "./any.js": 1,
                        "./async": 2,
                        "./bind": 3,
                        "./call_get.js": 5,
                        "./cancel": 6,
                        "./catch_filter": 7,
                        "./context": 8,
                        "./debuggability": 9,
                        "./direct_resolve": 10,
                        "./each.js": 11,
                        "./errors": 12,
                        "./es5": 13,
                        "./filter.js": 14,
                        "./finally": 15,
                        "./generators.js": 16,
                        "./join": 17,
                        "./map.js": 18,
                        "./method": 19,
                        "./nodeback": 20,
                        "./nodeify.js": 21,
                        "./promise_array": 23,
                        "./promisify.js": 24,
                        "./props.js": 25,
                        "./race.js": 27,
                        "./reduce.js": 28,
                        "./settle.js": 30,
                        "./some.js": 31,
                        "./synchronous_inspection": 32,
                        "./thenables": 33,
                        "./timers.js": 34,
                        "./using.js": 35,
                        "./util": 36
                    } ],
                    23: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d, e, f) {
                            function g(a) {
                                switch (a) {
                                  case -2:
                                    return [];

                                  case -3:
                                    return {};

                                  case -6:
                                    return new Map();
                                }
                            }
                            function h(a) {
                                var d = this._promise = new b(c);
                                a instanceof b && d._propagateFrom(a, 3), d._setOnCancel(this), this._values = a, 
                                this._length = 0, this._totalResolved = 0, this._init(void 0, -2);
                            }
                            var i = a("./util");
                            i.isArray;
                            return i.inherits(h, f), h.prototype.length = function() {
                                return this._length;
                            }, h.prototype.promise = function() {
                                return this._promise;
                            }, h.prototype._init = function a(c, f) {
                                var h = d(this._values, this._promise);
                                if (h instanceof b) {
                                    h = h._target();
                                    var j = h._bitField;
                                    if (this._values = h, 0 == (50397184 & j)) return this._promise._setAsyncGuaranteed(), 
                                    h._then(a, this._reject, void 0, this, f);
                                    if (0 == (33554432 & j)) return 0 != (16777216 & j) ? this._reject(h._reason()) : this._cancel();
                                    h = h._value();
                                }
                                if (null === (h = i.asArray(h))) {
                                    var k = e("expecting an array or an iterable object but got " + i.classString(h)).reason();
                                    return void this._promise._rejectCallback(k, !1);
                                }
                                if (0 === h.length) return void (-5 === f ? this._resolveEmptyArray() : this._resolve(g(f)));
                                this._iterate(h);
                            }, h.prototype._iterate = function(a) {
                                var c = this.getActualLength(a.length);
                                this._length = c, this._values = this.shouldCopyValues() ? new Array(c) : this._values;
                                for (var e = this._promise, f = !1, g = null, h = 0; h < c; ++h) {
                                    var i = d(a[h], e);
                                    i instanceof b ? (i = i._target(), g = i._bitField) : g = null, f ? null !== g && i.suppressUnhandledRejections() : null !== g ? 0 == (50397184 & g) ? (i._proxy(this, h), 
                                    this._values[h] = i) : f = 0 != (33554432 & g) ? this._promiseFulfilled(i._value(), h) : 0 != (16777216 & g) ? this._promiseRejected(i._reason(), h) : this._promiseCancelled(h) : f = this._promiseFulfilled(i, h);
                                }
                                f || e._setAsyncGuaranteed();
                            }, h.prototype._isResolved = function() {
                                return null === this._values;
                            }, h.prototype._resolve = function(a) {
                                this._values = null, this._promise._fulfill(a);
                            }, h.prototype._cancel = function() {
                                !this._isResolved() && this._promise._isCancellable() && (this._values = null, this._promise._cancel());
                            }, h.prototype._reject = function(a) {
                                this._values = null, this._promise._rejectCallback(a, !1);
                            }, h.prototype._promiseFulfilled = function(a, b) {
                                return this._values[b] = a, ++this._totalResolved >= this._length && (this._resolve(this._values), 
                                !0);
                            }, h.prototype._promiseCancelled = function() {
                                return this._cancel(), !0;
                            }, h.prototype._promiseRejected = function(a) {
                                return this._totalResolved++, this._reject(a), !0;
                            }, h.prototype._resultCancelled = function() {
                                if (!this._isResolved()) {
                                    var a = this._values;
                                    if (this._cancel(), a instanceof b) a.cancel(); else for (var c = 0; c < a.length; ++c) a[c] instanceof b && a[c].cancel();
                                }
                            }, h.prototype.shouldCopyValues = function() {
                                return !0;
                            }, h.prototype.getActualLength = function(a) {
                                return a;
                            }, h;
                        };
                    }, {
                        "./util": 36
                    } ],
                    24: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c) {
                            function d(a) {
                                return !v.test(a);
                            }
                            function e(a) {
                                try {
                                    return !0 === a.__isPromisified__;
                                } catch (a) {
                                    return !1;
                                }
                            }
                            function f(a, b, c) {
                                var d = n.getDataPropertyOrDefault(a, b + c, t);
                                return !!d && e(d);
                            }
                            function g(a, b, c) {
                                for (var d = 0; d < a.length; d += 2) {
                                    var e = a[d];
                                    if (c.test(e)) for (var f = e.replace(c, ""), g = 0; g < a.length; g += 2) if (a[g] === f) throw new s("Cannot promisify an API that has normal methods with '%s'-suffix\n\n    See http://goo.gl/MqrFmX\n".replace("%s", b));
                                }
                            }
                            function h(a, b, c, d) {
                                for (var h = n.inheritedDataKeys(a), i = [], j = 0; j < h.length; ++j) {
                                    var k = h[j], l = a[k], m = d === w || w(k, l, a);
                                    "function" != typeof l || e(l) || f(a, k, b) || !d(k, l, a, m) || i.push(k, l);
                                }
                                return g(i, b, c), i;
                            }
                            function i(a, d, e, f, g, h) {
                                function i() {
                                    var e = d;
                                    d === m && (e = this);
                                    var f = new b(c);
                                    f._captureStackTrace();
                                    var g = "string" == typeof k && this !== j ? this[k] : a, i = o(f, h);
                                    try {
                                        g.apply(e, p(arguments, i));
                                    } catch (a) {
                                        f._rejectCallback(q(a), !0, !0);
                                    }
                                    return f._isFateSealed() || f._setAsyncGuaranteed(), f;
                                }
                                var j = function() {
                                    return this;
                                }(), k = a;
                                return "string" == typeof k && (a = f), n.notEnumerableProp(i, "__isPromisified__", !0), 
                                i;
                            }
                            function j(a, b, c, d, e) {
                                for (var f = new RegExp(x(b) + "$"), g = h(a, b, f, c), i = 0, j = g.length; i < j; i += 2) {
                                    var k = g[i], l = g[i + 1], o = k + b;
                                    if (d === y) a[o] = y(k, m, k, l, b, e); else {
                                        var p = d(l, function() {
                                            return y(k, m, k, l, b, e);
                                        });
                                        n.notEnumerableProp(p, "__isPromisified__", !0), a[o] = p;
                                    }
                                }
                                return n.toFastProperties(a), a;
                            }
                            function k(a, b, c) {
                                return y(a, b, void 0, a, null, c);
                            }
                            var l, m = {}, n = a("./util"), o = a("./nodeback"), p = n.withAppended, q = n.maybeWrapAsError, r = n.canEvaluate, s = a("./errors").TypeError, t = {
                                __isPromisified__: !0
                            }, u = [ "arity", "length", "name", "arguments", "caller", "callee", "prototype", "__isPromisified__" ], v = new RegExp("^(?:" + u.join("|") + ")$"), w = function(a) {
                                return n.isIdentifier(a) && "_" !== a.charAt(0) && "constructor" !== a;
                            }, x = function(a) {
                                return a.replace(/([$])/, "\\$");
                            }, y = r ? l : i;
                            b.promisify = function(a, b) {
                                if ("function" != typeof a) throw new s("expecting a function but got " + n.classString(a));
                                if (e(a)) return a;
                                b = Object(b);
                                var c = void 0 === b.context ? m : b.context, f = !!b.multiArgs, g = k(a, c, f);
                                return n.copyDescriptors(a, g, d), g;
                            }, b.promisifyAll = function(a, b) {
                                if ("function" != typeof a && "object" != typeof a) throw new s("the target of promisifyAll must be an object or a function\n\n    See http://goo.gl/MqrFmX\n");
                                b = Object(b);
                                var c = !!b.multiArgs, d = b.suffix;
                                "string" != typeof d && (d = "Async");
                                var e = b.filter;
                                "function" != typeof e && (e = w);
                                var f = b.promisifier;
                                if ("function" != typeof f && (f = y), !n.isIdentifier(d)) throw new RangeError("suffix must be a valid identifier\n\n    See http://goo.gl/MqrFmX\n");
                                for (var g = n.inheritedDataKeys(a), h = 0; h < g.length; ++h) {
                                    var i = a[g[h]];
                                    "constructor" !== g[h] && n.isClass(i) && (j(i.prototype, d, e, f, c), j(i, d, e, f, c));
                                }
                                return j(a, d, e, f, c);
                            };
                        };
                    }, {
                        "./errors": 12,
                        "./nodeback": 20,
                        "./util": 36
                    } ],
                    25: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d, e) {
                            function f(a) {
                                var b, c = !1;
                                if (void 0 !== h && a instanceof h) b = l(a), c = !0; else {
                                    var d = k.keys(a), e = d.length;
                                    b = new Array(2 * e);
                                    for (var f = 0; f < e; ++f) {
                                        var g = d[f];
                                        b[f] = a[g], b[f + e] = g;
                                    }
                                }
                                this.constructor$(b), this._isMap = c, this._init$(void 0, c ? -6 : -3);
                            }
                            function g(a) {
                                var c, g = d(a);
                                return j(g) ? (c = g instanceof b ? g._then(b.props, void 0, void 0, void 0, void 0) : new f(g).promise(), 
                                g instanceof b && c._propagateFrom(g, 2), c) : e("cannot await properties of a non-object\n\n    See http://goo.gl/MqrFmX\n");
                            }
                            var h, i = a("./util"), j = i.isObject, k = a("./es5");
                            "function" == typeof Map && (h = Map);
                            var l = function() {
                                function a(a, d) {
                                    this[b] = a, this[b + c] = d, b++;
                                }
                                var b = 0, c = 0;
                                return function(d) {
                                    c = d.size, b = 0;
                                    var e = new Array(2 * d.size);
                                    return d.forEach(a, e), e;
                                };
                            }(), m = function(a) {
                                for (var b = new h(), c = a.length / 2 | 0, d = 0; d < c; ++d) {
                                    var e = a[c + d], f = a[d];
                                    b.set(e, f);
                                }
                                return b;
                            };
                            i.inherits(f, c), f.prototype._init = function() {}, f.prototype._promiseFulfilled = function(a, b) {
                                if (this._values[b] = a, ++this._totalResolved >= this._length) {
                                    var c;
                                    if (this._isMap) c = m(this._values); else {
                                        c = {};
                                        for (var d = this.length(), e = 0, f = this.length(); e < f; ++e) c[this._values[e + d]] = this._values[e];
                                    }
                                    return this._resolve(c), !0;
                                }
                                return !1;
                            }, f.prototype.shouldCopyValues = function() {
                                return !1;
                            }, f.prototype.getActualLength = function(a) {
                                return a >> 1;
                            }, b.prototype.props = function() {
                                return g(this);
                            }, b.props = function(a) {
                                return g(a);
                            };
                        };
                    }, {
                        "./es5": 13,
                        "./util": 36
                    } ],
                    26: [ function(a, b, c) {
                        "use strict";
                        function d(a, b, c, d, e) {
                            for (var f = 0; f < e; ++f) c[f + d] = a[f + b], a[f + b] = void 0;
                        }
                        function e(a) {
                            this._capacity = a, this._length = 0, this._front = 0;
                        }
                        e.prototype._willBeOverCapacity = function(a) {
                            return this._capacity < a;
                        }, e.prototype._pushOne = function(a) {
                            var b = this.length();
                            this._checkCapacity(b + 1), this[this._front + b & this._capacity - 1] = a, this._length = b + 1;
                        }, e.prototype.push = function(a, b, c) {
                            var d = this.length() + 3;
                            if (this._willBeOverCapacity(d)) return this._pushOne(a), this._pushOne(b), void this._pushOne(c);
                            var e = this._front + d - 3;
                            this._checkCapacity(d);
                            var f = this._capacity - 1;
                            this[e + 0 & f] = a, this[e + 1 & f] = b, this[e + 2 & f] = c, this._length = d;
                        }, e.prototype.shift = function() {
                            var a = this._front, b = this[a];
                            return this[a] = void 0, this._front = a + 1 & this._capacity - 1, this._length--, 
                            b;
                        }, e.prototype.length = function() {
                            return this._length;
                        }, e.prototype._checkCapacity = function(a) {
                            this._capacity < a && this._resizeTo(this._capacity << 1);
                        }, e.prototype._resizeTo = function(a) {
                            var b = this._capacity;
                            this._capacity = a, d(this, 0, this, b, this._front + this._length & b - 1);
                        }, b.exports = e;
                    }, {} ],
                    27: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d, e) {
                            function f(a, f) {
                                var i = d(a);
                                if (i instanceof b) return h(i);
                                if (null === (a = g.asArray(a))) return e("expecting an array or an iterable object but got " + g.classString(a));
                                var j = new b(c);
                                void 0 !== f && j._propagateFrom(f, 3);
                                for (var k = j._fulfill, l = j._reject, m = 0, n = a.length; m < n; ++m) {
                                    var o = a[m];
                                    (void 0 !== o || m in a) && b.cast(o)._then(k, l, void 0, j, null);
                                }
                                return j;
                            }
                            var g = a("./util"), h = function(a) {
                                return a.then(function(b) {
                                    return f(b, a);
                                });
                            };
                            b.race = function(a) {
                                return f(a, void 0);
                            }, b.prototype.race = function() {
                                return f(this, void 0);
                            };
                        };
                    }, {
                        "./util": 36
                    } ],
                    28: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d, e, f, g) {
                            function h(a, c, d, e) {
                                this.constructor$(a);
                                var g = m();
                                this._fn = null === g ? c : n.domainBind(g, c), void 0 !== d && (d = b.resolve(d), 
                                d._attachCancellationCallback(this)), this._initialValue = d, this._currentCancellable = null, 
                                this._eachValues = e === f ? Array(this._length) : 0 === e ? null : void 0, this._promise._captureStackTrace(), 
                                this._init$(void 0, -5);
                            }
                            function i(a, b) {
                                this.isFulfilled() ? b._resolve(a) : b._reject(a);
                            }
                            function j(a, b, c, e) {
                                return "function" != typeof b ? d("expecting a function but got " + n.classString(b)) : new h(a, b, c, e).promise();
                            }
                            function k(a) {
                                this.accum = a, this.array._gotAccum(a);
                                var c = e(this.value, this.array._promise);
                                return c instanceof b ? (this.array._currentCancellable = c, c._then(l, void 0, void 0, this, void 0)) : l.call(this, c);
                            }
                            function l(a) {
                                var c = this.array, d = c._promise, e = o(c._fn);
                                d._pushContext();
                                var f;
                                (f = void 0 !== c._eachValues ? e.call(d._boundValue(), a, this.index, this.length) : e.call(d._boundValue(), this.accum, a, this.index, this.length)) instanceof b && (c._currentCancellable = f);
                                var h = d._popContext();
                                return g.checkForgottenReturns(f, h, void 0 !== c._eachValues ? "Promise.each" : "Promise.reduce", d), 
                                f;
                            }
                            var m = b._getDomain, n = a("./util"), o = n.tryCatch;
                            n.inherits(h, c), h.prototype._gotAccum = function(a) {
                                void 0 !== this._eachValues && null !== this._eachValues && a !== f && this._eachValues.push(a);
                            }, h.prototype._eachComplete = function(a) {
                                return null !== this._eachValues && this._eachValues.push(a), this._eachValues;
                            }, h.prototype._init = function() {}, h.prototype._resolveEmptyArray = function() {
                                this._resolve(void 0 !== this._eachValues ? this._eachValues : this._initialValue);
                            }, h.prototype.shouldCopyValues = function() {
                                return !1;
                            }, h.prototype._resolve = function(a) {
                                this._promise._resolveCallback(a), this._values = null;
                            }, h.prototype._resultCancelled = function(a) {
                                if (a === this._initialValue) return this._cancel();
                                this._isResolved() || (this._resultCancelled$(), this._currentCancellable instanceof b && this._currentCancellable.cancel(), 
                                this._initialValue instanceof b && this._initialValue.cancel());
                            }, h.prototype._iterate = function(a) {
                                this._values = a;
                                var c, d, e = a.length;
                                if (void 0 !== this._initialValue ? (c = this._initialValue, d = 0) : (c = b.resolve(a[0]), 
                                d = 1), this._currentCancellable = c, !c.isRejected()) for (;d < e; ++d) {
                                    var f = {
                                        accum: null,
                                        value: a[d],
                                        index: d,
                                        length: e,
                                        array: this
                                    };
                                    c = c._then(k, void 0, void 0, f, void 0);
                                }
                                void 0 !== this._eachValues && (c = c._then(this._eachComplete, void 0, void 0, this, void 0)), 
                                c._then(i, i, void 0, c, this);
                            }, b.prototype.reduce = function(a, b) {
                                return j(this, a, b, null);
                            }, b.reduce = function(a, b, c, d) {
                                return j(a, b, c, d);
                            };
                        };
                    }, {
                        "./util": 36
                    } ],
                    29: [ function(b, c, e) {
                        "use strict";
                        var f, g = b("./util"), h = function() {
                            throw new Error("No async scheduler available\n\n    See http://goo.gl/MqrFmX\n");
                        }, i = g.getNativePromise();
                        if (g.isNode && "undefined" == typeof MutationObserver) {
                            var j = d.setImmediate, k = a.nextTick;
                            f = g.isRecentNode ? function(a) {
                                j.call(d, a);
                            } : function(b) {
                                k.call(a, b);
                            };
                        } else if ("function" == typeof i && "function" == typeof i.resolve) {
                            var l = i.resolve();
                            f = function(a) {
                                l.then(a);
                            };
                        } else f = "undefined" == typeof MutationObserver || "undefined" != typeof window && window.navigator && (window.navigator.standalone || window.cordova) ? "undefined" != typeof setImmediate ? function(a) {
                            setImmediate(a);
                        } : "undefined" != typeof setTimeout ? function(a) {
                            setTimeout(a, 0);
                        } : h : function() {
                            var a = document.createElement("div"), b = {
                                attributes: !0
                            }, c = !1, d = document.createElement("div");
                            new MutationObserver(function() {
                                a.classList.toggle("foo"), c = !1;
                            }).observe(d, b);
                            var e = function() {
                                c || (c = !0, d.classList.toggle("foo"));
                            };
                            return function(c) {
                                var d = new MutationObserver(function() {
                                    d.disconnect(), c();
                                });
                                d.observe(a, b), e();
                            };
                        }();
                        c.exports = f;
                    }, {
                        "./util": 36
                    } ],
                    30: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d) {
                            function e(a) {
                                this.constructor$(a);
                            }
                            var f = b.PromiseInspection;
                            a("./util").inherits(e, c), e.prototype._promiseResolved = function(a, b) {
                                return this._values[a] = b, ++this._totalResolved >= this._length && (this._resolve(this._values), 
                                !0);
                            }, e.prototype._promiseFulfilled = function(a, b) {
                                var c = new f();
                                return c._bitField = 33554432, c._settledValueField = a, this._promiseResolved(b, c);
                            }, e.prototype._promiseRejected = function(a, b) {
                                var c = new f();
                                return c._bitField = 16777216, c._settledValueField = a, this._promiseResolved(b, c);
                            }, b.settle = function(a) {
                                return d.deprecated(".settle()", ".reflect()"), new e(a).promise();
                            }, b.prototype.settle = function() {
                                return b.settle(this);
                            };
                        };
                    }, {
                        "./util": 36
                    } ],
                    31: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d) {
                            function e(a) {
                                this.constructor$(a), this._howMany = 0, this._unwrap = !1, this._initialized = !1;
                            }
                            function f(a, b) {
                                if ((0 | b) !== b || b < 0) return d("expecting a positive integer\n\n    See http://goo.gl/MqrFmX\n");
                                var c = new e(a), f = c.promise();
                                return c.setHowMany(b), c.init(), f;
                            }
                            var g = a("./util"), h = a("./errors").RangeError, i = a("./errors").AggregateError, j = g.isArray, k = {};
                            g.inherits(e, c), e.prototype._init = function() {
                                if (this._initialized) {
                                    if (0 === this._howMany) return void this._resolve([]);
                                    this._init$(void 0, -5);
                                    var a = j(this._values);
                                    !this._isResolved() && a && this._howMany > this._canPossiblyFulfill() && this._reject(this._getRangeError(this.length()));
                                }
                            }, e.prototype.init = function() {
                                this._initialized = !0, this._init();
                            }, e.prototype.setUnwrap = function() {
                                this._unwrap = !0;
                            }, e.prototype.howMany = function() {
                                return this._howMany;
                            }, e.prototype.setHowMany = function(a) {
                                this._howMany = a;
                            }, e.prototype._promiseFulfilled = function(a) {
                                return this._addFulfilled(a), this._fulfilled() === this.howMany() && (this._values.length = this.howMany(), 
                                1 === this.howMany() && this._unwrap ? this._resolve(this._values[0]) : this._resolve(this._values), 
                                !0);
                            }, e.prototype._promiseRejected = function(a) {
                                return this._addRejected(a), this._checkOutcome();
                            }, e.prototype._promiseCancelled = function() {
                                return this._values instanceof b || null == this._values ? this._cancel() : (this._addRejected(k), 
                                this._checkOutcome());
                            }, e.prototype._checkOutcome = function() {
                                if (this.howMany() > this._canPossiblyFulfill()) {
                                    for (var a = new i(), b = this.length(); b < this._values.length; ++b) this._values[b] !== k && a.push(this._values[b]);
                                    return a.length > 0 ? this._reject(a) : this._cancel(), !0;
                                }
                                return !1;
                            }, e.prototype._fulfilled = function() {
                                return this._totalResolved;
                            }, e.prototype._rejected = function() {
                                return this._values.length - this.length();
                            }, e.prototype._addRejected = function(a) {
                                this._values.push(a);
                            }, e.prototype._addFulfilled = function(a) {
                                this._values[this._totalResolved++] = a;
                            }, e.prototype._canPossiblyFulfill = function() {
                                return this.length() - this._rejected();
                            }, e.prototype._getRangeError = function(a) {
                                var b = "Input array must contain at least " + this._howMany + " items but contains only " + a + " items";
                                return new h(b);
                            }, e.prototype._resolveEmptyArray = function() {
                                this._reject(this._getRangeError(0));
                            }, b.some = function(a, b) {
                                return f(a, b);
                            }, b.prototype.some = function(a) {
                                return f(this, a);
                            }, b._SomePromiseArray = e;
                        };
                    }, {
                        "./errors": 12,
                        "./util": 36
                    } ],
                    32: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(a) {
                            function b(a) {
                                void 0 !== a ? (a = a._target(), this._bitField = a._bitField, this._settledValueField = a._isFateSealed() ? a._settledValue() : void 0) : (this._bitField = 0, 
                                this._settledValueField = void 0);
                            }
                            b.prototype._settledValue = function() {
                                return this._settledValueField;
                            };
                            var c = b.prototype.value = function() {
                                if (!this.isFulfilled()) throw new TypeError("cannot get fulfillment value of a non-fulfilled promise\n\n    See http://goo.gl/MqrFmX\n");
                                return this._settledValue();
                            }, d = b.prototype.error = b.prototype.reason = function() {
                                if (!this.isRejected()) throw new TypeError("cannot get rejection reason of a non-rejected promise\n\n    See http://goo.gl/MqrFmX\n");
                                return this._settledValue();
                            }, e = b.prototype.isFulfilled = function() {
                                return 0 != (33554432 & this._bitField);
                            }, f = b.prototype.isRejected = function() {
                                return 0 != (16777216 & this._bitField);
                            }, g = b.prototype.isPending = function() {
                                return 0 == (50397184 & this._bitField);
                            }, h = b.prototype.isResolved = function() {
                                return 0 != (50331648 & this._bitField);
                            };
                            b.prototype.isCancelled = function() {
                                return 0 != (8454144 & this._bitField);
                            }, a.prototype.__isCancelled = function() {
                                return 65536 == (65536 & this._bitField);
                            }, a.prototype._isCancelled = function() {
                                return this._target().__isCancelled();
                            }, a.prototype.isCancelled = function() {
                                return 0 != (8454144 & this._target()._bitField);
                            }, a.prototype.isPending = function() {
                                return g.call(this._target());
                            }, a.prototype.isRejected = function() {
                                return f.call(this._target());
                            }, a.prototype.isFulfilled = function() {
                                return e.call(this._target());
                            }, a.prototype.isResolved = function() {
                                return h.call(this._target());
                            }, a.prototype.value = function() {
                                return c.call(this._target());
                            }, a.prototype.reason = function() {
                                var a = this._target();
                                return a._unsetRejectionIsUnhandled(), d.call(a);
                            }, a.prototype._value = function() {
                                return this._settledValue();
                            }, a.prototype._reason = function() {
                                return this._unsetRejectionIsUnhandled(), this._settledValue();
                            }, a.PromiseInspection = b;
                        };
                    }, {} ],
                    33: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c) {
                            function d(a, d) {
                                if (k(a)) {
                                    if (a instanceof b) return a;
                                    var e = f(a);
                                    if (e === j) {
                                        d && d._pushContext();
                                        var i = b.reject(e.e);
                                        return d && d._popContext(), i;
                                    }
                                    if ("function" == typeof e) {
                                        if (g(a)) {
                                            var i = new b(c);
                                            return a._then(i._fulfill, i._reject, void 0, i, null), i;
                                        }
                                        return h(a, e, d);
                                    }
                                }
                                return a;
                            }
                            function e(a) {
                                return a.then;
                            }
                            function f(a) {
                                try {
                                    return e(a);
                                } catch (a) {
                                    return j.e = a, j;
                                }
                            }
                            function g(a) {
                                try {
                                    return l.call(a, "_promise0");
                                } catch (a) {
                                    return !1;
                                }
                            }
                            function h(a, d, e) {
                                function f(a) {
                                    h && (h._resolveCallback(a), h = null);
                                }
                                function g(a) {
                                    h && (h._rejectCallback(a, l, !0), h = null);
                                }
                                var h = new b(c), k = h;
                                e && e._pushContext(), h._captureStackTrace(), e && e._popContext();
                                var l = !0, m = i.tryCatch(d).call(a, f, g);
                                return l = !1, h && m === j && (h._rejectCallback(m.e, !0, !0), h = null), k;
                            }
                            var i = a("./util"), j = i.errorObj, k = i.isObject, l = {}.hasOwnProperty;
                            return d;
                        };
                    }, {
                        "./util": 36
                    } ],
                    34: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d) {
                            function e(a) {
                                this.handle = a;
                            }
                            function f(a) {
                                return clearTimeout(this.handle), a;
                            }
                            function g(a) {
                                throw clearTimeout(this.handle), a;
                            }
                            var h = a("./util"), i = b.TimeoutError;
                            e.prototype._resultCancelled = function() {
                                clearTimeout(this.handle);
                            };
                            var j = function(a) {
                                return k(+this).thenReturn(a);
                            }, k = b.delay = function(a, f) {
                                var g, h;
                                return void 0 !== f ? (g = b.resolve(f)._then(j, null, null, a, void 0), d.cancellation() && f instanceof b && g._setOnCancel(f)) : (g = new b(c), 
                                h = setTimeout(function() {
                                    g._fulfill();
                                }, +a), d.cancellation() && g._setOnCancel(new e(h)), g._captureStackTrace()), g._setAsyncGuaranteed(), 
                                g;
                            };
                            b.prototype.delay = function(a) {
                                return k(a, this);
                            };
                            var l = function(a, b, c) {
                                var d;
                                d = "string" != typeof b ? b instanceof Error ? b : new i("operation timed out") : new i(b), 
                                h.markAsOriginatingFromRejection(d), a._attachExtraTrace(d), a._reject(d), null != c && c.cancel();
                            };
                            b.prototype.timeout = function(a, b) {
                                a = +a;
                                var c, h, i = new e(setTimeout(function() {
                                    c.isPending() && l(c, b, h);
                                }, a));
                                return d.cancellation() ? (h = this.then(), c = h._then(f, g, void 0, i, void 0), 
                                c._setOnCancel(i)) : c = this._then(f, g, void 0, i, void 0), c;
                            };
                        };
                    }, {
                        "./util": 36
                    } ],
                    35: [ function(a, b, c) {
                        "use strict";
                        b.exports = function(b, c, d, e, f, g) {
                            function h(a) {
                                setTimeout(function() {
                                    throw a;
                                }, 0);
                            }
                            function i(a) {
                                var b = d(a);
                                return b !== a && "function" == typeof a._isDisposable && "function" == typeof a._getDisposer && a._isDisposable() && b._setDisposable(a._getDisposer()), 
                                b;
                            }
                            function j(a, c) {
                                function e() {
                                    if (g >= j) return k._fulfill();
                                    var f = i(a[g++]);
                                    if (f instanceof b && f._isDisposable()) {
                                        try {
                                            f = d(f._getDisposer().tryDispose(c), a.promise);
                                        } catch (a) {
                                            return h(a);
                                        }
                                        if (f instanceof b) return f._then(e, h, null, null, null);
                                    }
                                    e();
                                }
                                var g = 0, j = a.length, k = new b(f);
                                return e(), k;
                            }
                            function k(a, b, c) {
                                this._data = a, this._promise = b, this._context = c;
                            }
                            function l(a, b, c) {
                                this.constructor$(a, b, c);
                            }
                            function m(a) {
                                return k.isDisposer(a) ? (this.resources[this.index]._setDisposable(a), a.promise()) : a;
                            }
                            function n(a) {
                                this.length = a, this.promise = null, this[a - 1] = null;
                            }
                            var o = a("./util"), p = a("./errors").TypeError, q = a("./util").inherits, r = o.errorObj, s = o.tryCatch, t = {};
                            k.prototype.data = function() {
                                return this._data;
                            }, k.prototype.promise = function() {
                                return this._promise;
                            }, k.prototype.resource = function() {
                                return this.promise().isFulfilled() ? this.promise().value() : t;
                            }, k.prototype.tryDispose = function(a) {
                                var b = this.resource(), c = this._context;
                                void 0 !== c && c._pushContext();
                                var d = b !== t ? this.doDispose(b, a) : null;
                                return void 0 !== c && c._popContext(), this._promise._unsetDisposable(), this._data = null, 
                                d;
                            }, k.isDisposer = function(a) {
                                return null != a && "function" == typeof a.resource && "function" == typeof a.tryDispose;
                            }, q(l, k), l.prototype.doDispose = function(a, b) {
                                return this.data().call(a, a, b);
                            }, n.prototype._resultCancelled = function() {
                                for (var a = this.length, c = 0; c < a; ++c) {
                                    var d = this[c];
                                    d instanceof b && d.cancel();
                                }
                            }, b.using = function() {
                                var a = arguments.length;
                                if (a < 2) return c("you must pass at least 2 arguments to Promise.using");
                                var e = arguments[a - 1];
                                if ("function" != typeof e) return c("expecting a function but got " + o.classString(e));
                                var f, h = !0;
                                2 === a && Array.isArray(arguments[0]) ? (f = arguments[0], a = f.length, h = !1) : (f = arguments, 
                                a--);
                                for (var i = new n(a), l = 0; l < a; ++l) {
                                    var p = f[l];
                                    if (k.isDisposer(p)) {
                                        var q = p;
                                        p = p.promise(), p._setDisposable(q);
                                    } else {
                                        var t = d(p);
                                        t instanceof b && (p = t._then(m, null, null, {
                                            resources: i,
                                            index: l
                                        }, void 0));
                                    }
                                    i[l] = p;
                                }
                                for (var u = new Array(i.length), l = 0; l < u.length; ++l) u[l] = b.resolve(i[l]).reflect();
                                var v = b.all(u).then(function(a) {
                                    for (var b = 0; b < a.length; ++b) {
                                        var c = a[b];
                                        if (c.isRejected()) return r.e = c.error(), r;
                                        if (!c.isFulfilled()) return void v.cancel();
                                        a[b] = c.value();
                                    }
                                    w._pushContext(), e = s(e);
                                    var d = h ? e.apply(void 0, a) : e(a), f = w._popContext();
                                    return g.checkForgottenReturns(d, f, "Promise.using", w), d;
                                }), w = v.lastly(function() {
                                    var a = new b.PromiseInspection(v);
                                    return j(i, a);
                                });
                                return i.promise = w, w._setOnCancel(i), w;
                            }, b.prototype._setDisposable = function(a) {
                                this._bitField = 131072 | this._bitField, this._disposer = a;
                            }, b.prototype._isDisposable = function() {
                                return (131072 & this._bitField) > 0;
                            }, b.prototype._getDisposer = function() {
                                return this._disposer;
                            }, b.prototype._unsetDisposable = function() {
                                this._bitField = -131073 & this._bitField, this._disposer = void 0;
                            }, b.prototype.disposer = function(a) {
                                if ("function" == typeof a) return new l(a, this, e());
                                throw new p();
                            };
                        };
                    }, {
                        "./errors": 12,
                        "./util": 36
                    } ],
                    36: [ function(b, c, e) {
                        "use strict";
                        function f() {
                            try {
                                var a = F;
                                return F = null, a.apply(this, arguments);
                            } catch (a) {
                                return E.e = a, E;
                            }
                        }
                        function g(a) {
                            return F = a, f;
                        }
                        function h(a) {
                            return null == a || !0 === a || !1 === a || "string" == typeof a || "number" == typeof a;
                        }
                        function i(a) {
                            return "function" == typeof a || "object" == typeof a && null !== a;
                        }
                        function j(a) {
                            return h(a) ? new Error(s(a)) : a;
                        }
                        function k(a, b) {
                            var c, d = a.length, e = new Array(d + 1);
                            for (c = 0; c < d; ++c) e[c] = a[c];
                            return e[c] = b, e;
                        }
                        function l(a, b, c) {
                            if (!C.isES5) return {}.hasOwnProperty.call(a, b) ? a[b] : void 0;
                            var d = Object.getOwnPropertyDescriptor(a, b);
                            return null != d ? null == d.get && null == d.set ? d.value : c : void 0;
                        }
                        function m(a, b, c) {
                            if (h(a)) return a;
                            var d = {
                                value: c,
                                configurable: !0,
                                enumerable: !1,
                                writable: !0
                            };
                            return C.defineProperty(a, b, d), a;
                        }
                        function n(a) {
                            throw a;
                        }
                        function o(a) {
                            try {
                                if ("function" == typeof a) {
                                    var b = C.names(a.prototype), c = C.isES5 && b.length > 1, d = b.length > 0 && !(1 === b.length && "constructor" === b[0]), e = J.test(a + "") && C.names(a).length > 0;
                                    if (c || d || e) return !0;
                                }
                                return !1;
                            } catch (a) {
                                return !1;
                            }
                        }
                        function p(a) {
                            function b() {}
                            b.prototype = a;
                            for (var c = 8; c--; ) new b();
                            return a;
                        }
                        function q(a) {
                            return K.test(a);
                        }
                        function r(a, b, c) {
                            for (var d = new Array(a), e = 0; e < a; ++e) d[e] = b + e + c;
                            return d;
                        }
                        function s(a) {
                            try {
                                return a + "";
                            } catch (a) {
                                return "[no string representation]";
                            }
                        }
                        function t(a) {
                            return a instanceof Error || null !== a && "object" == typeof a && "string" == typeof a.message && "string" == typeof a.name;
                        }
                        function u(a) {
                            try {
                                m(a, "isOperational", !0);
                            } catch (a) {}
                        }
                        function v(a) {
                            return null != a && (a instanceof Error.__BluebirdErrorTypes__.OperationalError || !0 === a.isOperational);
                        }
                        function w(a) {
                            return t(a) && C.propertyIsWritable(a, "stack");
                        }
                        function x(a) {
                            return {}.toString.call(a);
                        }
                        function y(a, b, c) {
                            for (var d = C.names(a), e = 0; e < d.length; ++e) {
                                var f = d[e];
                                if (c(f)) try {
                                    C.defineProperty(b, f, C.getDescriptor(a, f));
                                } catch (a) {}
                            }
                        }
                        function z(b) {
                            return P ? a.env[b] : void 0;
                        }
                        function A() {
                            if ("function" == typeof Promise) try {
                                var a = new Promise(function() {});
                                if ("[object Promise]" === {}.toString.call(a)) return Promise;
                            } catch (a) {}
                        }
                        function B(a, b) {
                            return a.bind(b);
                        }
                        var C = b("./es5"), D = "undefined" == typeof navigator, E = {
                            e: {}
                        }, F, G = "undefined" != typeof self ? self : "undefined" != typeof window ? window : void 0 !== d ? d : void 0 !== this ? this : null, H = function(a, b) {
                            function c() {
                                this.constructor = a, this.constructor$ = b;
                                for (var c in b.prototype) d.call(b.prototype, c) && "$" !== c.charAt(c.length - 1) && (this[c + "$"] = b.prototype[c]);
                            }
                            var d = {}.hasOwnProperty;
                            return c.prototype = b.prototype, a.prototype = new c(), a.prototype;
                        }, I = function() {
                            var a = [ Array.prototype, Object.prototype, Function.prototype ], b = function(b) {
                                for (var c = 0; c < a.length; ++c) if (a[c] === b) return !0;
                                return !1;
                            };
                            if (C.isES5) {
                                var c = Object.getOwnPropertyNames;
                                return function(a) {
                                    for (var d = [], e = Object.create(null); null != a && !b(a); ) {
                                        var f;
                                        try {
                                            f = c(a);
                                        } catch (a) {
                                            return d;
                                        }
                                        for (var g = 0; g < f.length; ++g) {
                                            var h = f[g];
                                            if (!e[h]) {
                                                e[h] = !0;
                                                var i = Object.getOwnPropertyDescriptor(a, h);
                                                null != i && null == i.get && null == i.set && d.push(h);
                                            }
                                        }
                                        a = C.getPrototypeOf(a);
                                    }
                                    return d;
                                };
                            }
                            var d = {}.hasOwnProperty;
                            return function(c) {
                                if (b(c)) return [];
                                var e = [];
                                a: for (var f in c) if (d.call(c, f)) e.push(f); else {
                                    for (var g = 0; g < a.length; ++g) if (d.call(a[g], f)) continue a;
                                    e.push(f);
                                }
                                return e;
                            };
                        }(), J = /this\s*\.\s*\S+\s*=/, K = /^[a-z$_][a-z$_0-9]*$/i, L = function() {
                            return "stack" in new Error() ? function(a) {
                                return w(a) ? a : new Error(s(a));
                            } : function(a) {
                                if (w(a)) return a;
                                try {
                                    throw new Error(s(a));
                                } catch (a) {
                                    return a;
                                }
                            };
                        }(), M = function(a) {
                            return C.isArray(a) ? a : null;
                        };
                        if ("undefined" != typeof Symbol && Symbol.iterator) {
                            var N = "function" == typeof Array.from ? function(a) {
                                return Array.from(a);
                            } : function(a) {
                                for (var b, c = [], d = a[Symbol.iterator](); !(b = d.next()).done; ) c.push(b.value);
                                return c;
                            };
                            M = function(a) {
                                return C.isArray(a) ? a : null != a && "function" == typeof a[Symbol.iterator] ? N(a) : null;
                            };
                        }
                        var O = void 0 !== a && "[object process]" === x(a).toLowerCase(), P = void 0 !== a && void 0 !== a.env, Q = {
                            isClass: o,
                            isIdentifier: q,
                            inheritedDataKeys: I,
                            getDataPropertyOrDefault: l,
                            thrower: n,
                            isArray: C.isArray,
                            asArray: M,
                            notEnumerableProp: m,
                            isPrimitive: h,
                            isObject: i,
                            isError: t,
                            canEvaluate: D,
                            errorObj: E,
                            tryCatch: g,
                            inherits: H,
                            withAppended: k,
                            maybeWrapAsError: j,
                            toFastProperties: p,
                            filledRange: r,
                            toString: s,
                            canAttachTrace: w,
                            ensureErrorObject: L,
                            originatesFromRejection: v,
                            markAsOriginatingFromRejection: u,
                            classString: x,
                            copyDescriptors: y,
                            hasDevTools: "undefined" != typeof chrome && chrome && "function" == typeof chrome.loadTimes,
                            isNode: O,
                            hasEnvVariables: P,
                            env: z,
                            global: G,
                            getNativePromise: A,
                            domainBind: B
                        };
                        Q.isRecentNode = Q.isNode && function() {
                            var b = a.versions.node.split(".").map(Number);
                            return 0 === b[0] && b[1] > 10 || b[0] > 0;
                        }(), Q.isNode && Q.toFastProperties(a);
                        try {
                            throw new Error();
                        } catch (a) {
                            Q.lastLineError = a;
                        }
                        c.exports = Q;
                    }, {
                        "./es5": 13
                    } ]
                }, {}, [ 4 ])(4);
            }), "undefined" != typeof window && null !== window ? window.P = window.Promise : "undefined" != typeof self && null !== self && (self.P = self.Promise);
        }).call(this, a("_process"), "undefined" != typeof global ? global : "undefined" != typeof self ? self : "undefined" != typeof window ? window : {});
    }, {
        _process: 15
    } ],
    2: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.PreCallTest = void 0;
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("./turnConnection"), g = a("./tests/rttTest"), h = a("./tests/throughputTest"), i = a("./utility/resultsHandler"), j = a("./utility/onlineCheck"), k = a("./utility/stats/detectbrowser"), l = a("bluebird"), m = {
            RTT: "rtt",
            THROUGHPUT: "throughput"
        }, n = function() {
            function a() {
                d(this, a), this.browserInfo = (0, k.detect)(), this.turnConnection = new f.TurnConnection(this.browserInfo), 
                this.onlineCheck = new j.OnlineCheck(), this.callsInProgress = 0, this.turnTests = [ m.RTT, m.THROUGHPUT ], 
                this.active = !1, this.rtt = null, this.resultsHandler = null;
            }
            return e(a, [ {
                key: "start",
                value: function(a, b) {
                    if (this.browserInfo.browserName !== k.Constants.browserName.msie) if (this.iceServers = a, 
                    this.callback = b, this.active) this.callback && this.callback(null, "Not started: already in progress"); else if (this.callsInProgress > 0) this.callback && this.callback(null, "Not started: call in progress"); else if (a) {
                        this.turnTestCounter = 0, this.resultsHandler = new i.ResultsHandler();
                        var c = {
                            type: "browser",
                            os: this.browserInfo.os,
                            osVersion: this.browserInfo.osVersion,
                            buildName: this.browserInfo.browserName,
                            buildVersion: this.browserInfo.browserVersion
                        };
                        this.resultsHandler.add("endpointInfo", c), this.onlineCheck.start(), this.active = !0, 
                        this._start();
                    } else this.callback && this.callback(null, "Not started: no ICE servers given"); else this.callback && this.callback(null, "Not started: disabled for IE");
                }
            }, {
                key: "_start",
                value: function() {
                    var a = this;
                    this.active && this.turnConnection.connect(this.iceServers).then(function() {
                        a.active ? a.startTurnTests().then(function() {
                            a.stop();
                        }, function(b) {
                            a.stop();
                        }) : a.stop();
                    }, function(b) {
                        var c = b.continueFlag;
                        if (a.resultsHandler.failure(b), !c) {
                            a.turnConnection.disconnect(), a.active = !1;
                            var d = "";
                            try {
                                d = b.stack;
                            } catch (a) {
                                d = b.toString();
                            }
                            return d && "" !== d || (d = b.toString()), void a.callback(null, d);
                        }
                        a.resultsHandler.getFailureNumber() >= 10 ? a.stop() : (a.turnConnection.disconnect(), 
                        setTimeout(function() {
                            a._start();
                        }, 0));
                    });
                }
            }, {
                key: "stop",
                value: function() {
                    var a = this;
                    if (this.browserInfo.browserName !== k.Constants.browserName.msie && this.active) {
                        this.active = !1, this.activeTurnTest && this.activeTurnTest.forceStop();
                        var b = this.onlineCheck.stop();
                        this.resultsHandler && this.resultsHandler.add("onlineStatus", b), this.turnConnection.getIceResults().then(function(b) {
                            a.resultsHandler && a.resultsHandler.add("ice", b), a.turnConnection.disconnect(), 
                            a.sendResults();
                        }, function(b) {
                            a.resultsHandler && a.resultsHandler.failure(b), a.turnConnection.disconnect(), 
                            a.sendResults();
                        });
                    }
                }
            }, {
                key: "sendResults",
                value: function() {
                    this.resultsHandler || this.callback && this.callback(null, "No results present");
                    var a = this.resultsHandler.getResults();
                    this.callback && this.callback(a, null), this.resultsHandler = null;
                }
            }, {
                key: "callStarts",
                value: function() {
                    this.callsInProgress += 1, this.stop();
                }
            }, {
                key: "callFinished",
                value: function() {
                    this.callsInProgress -= 1;
                }
            }, {
                key: "getId",
                value: function() {
                    return this.resultsHandler ? this.resultsHandler.getId() : null;
                }
            }, {
                key: "crashDisconnect",
                value: function() {
                    try {
                        this.turnConnection.disconnect();
                    } catch (a) {}
                }
            }, {
                key: "startTurnTests",
                value: function() {
                    var a = this;
                    if (this.turnTestCounter >= this.turnTests.length) return new l(function(a, b) {
                        a();
                    });
                    var b = this.turnTests[this.turnTestCounter], c = null;
                    switch (b) {
                      case m.RTT:
                        c = new g.RttTest(this.turnConnection);
                        break;

                      case m.THROUGHPUT:
                        c = new h.ThroughputTest(this.turnConnection, this.rtt);
                        break;

                      default:
                        return new l(function(a, c) {
                            c(new Error("Unknown test: " + b));
                        });
                    }
                    return this.activeTurnTest = c, this.active ? c.start().then(function() {
                        return a.handleTestResults(b, c.getResults()), a.turnTestCounter += 1, a.activeTurnTest = null, 
                        a.startTurnTests();
                    }, function(d) {
                        return a.handleTestResults(b, c.getResults(), d), a.turnTestCounter += 1, a.activeTurnTest = null, 
                        a.startTurnTests();
                    }) : new l(function(a, b) {
                        b(new Error("Test trying to start while testing is not active"));
                    });
                }
            }, {
                key: "handleTestResults",
                value: function(a, b) {
                    null == (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null) && a == m.RTT && (this.rtt = b.median), 
                    this.resultsHandler && this.resultsHandler.add(a, b);
                }
            } ]), a;
        }();
        c.PreCallTest = n;
    }, {
        "./tests/rttTest": 3,
        "./tests/throughputTest": 4,
        "./turnConnection": 6,
        "./utility/onlineCheck": 8,
        "./utility/resultsHandler": 10,
        "./utility/stats/detectbrowser": 11,
        bluebird: 1
    } ],
    3: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        function e(a, b) {
            if (!a) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
            return !b || "object" != typeof b && "function" != typeof b ? a : b;
        }
        function f(a, b) {
            if ("function" != typeof b && null !== b) throw new TypeError("Super expression must either be null or a function, not " + typeof b);
            a.prototype = Object.create(b && b.prototype, {
                constructor: {
                    value: a,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), b && (Object.setPrototypeOf ? Object.setPrototypeOf(a, b) : a.__proto__ = b);
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.RttTest = void 0;
        var g = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), h = function a(b, c, d) {
            null === b && (b = Function.prototype);
            var e = Object.getOwnPropertyDescriptor(b, c);
            if (void 0 === e) {
                var f = Object.getPrototypeOf(b);
                return null === f ? void 0 : a(f, c, d);
            }
            if ("value" in e) return e.value;
            var g = e.get;
            return void 0 !== g ? g.call(d) : void 0;
        }, i = a("../utility/timestamps"), j = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(i), k = a("./turnTest"), l = function(a) {
            function b(a) {
                d(this, b);
                var c = e(this, (b.__proto__ || Object.getPrototypeOf(b)).call(this, a));
                return c.sendTimer = null, c.countSent = 0, c.rtts = [], c;
            }
            return f(b, k.TurnTest), g(b, [ {
                key: "initiate",
                value: function() {
                    this.results.startTimestamp = j.getCurrent(), this.sendPing();
                }
            }, {
                key: "handleMessage",
                value: function(a) {
                    if (this.isActive()) {
                        var b = parseInt(a, 10), c = this.calculateRtt(b);
                        this.rtts.push(c), this.countSent < 10 ? this.sendPing() : this.calculateMetrics();
                    }
                }
            }, {
                key: "handleError",
                value: function(a) {
                    this.fillResults(), this.failed(a);
                }
            }, {
                key: "sendPing",
                value: function() {
                    if (this.isActive()) {
                        var a = j.getCurrent();
                        this.send(a.toString()), this.countSent += 1, this.sendTimer && (clearTimeout(this.sendTimer), 
                        this.sendTimer = null), this.countSent < 10 ? this.sendTimer = setTimeout(this.sendPing.bind(this), 100) : this.sendTimer = setTimeout(this.calculateMetrics.bind(this), 500);
                    }
                }
            }, {
                key: "calculateRtt",
                value: function(a) {
                    return j.getCurrent() - a;
                }
            }, {
                key: "calculateMetrics",
                value: function() {
                    this.sendTimer && (clearTimeout(this.sendTimer), this.sendTimer = null), this.fillResults(), 
                    this.finished();
                }
            }, {
                key: "fillResults",
                value: function() {
                    this.results.sentMessages = this.countSent, this.results.unAckedMessages = this.countSent - this.rtts.length, 
                    this.results.maxMessages = 10, this.results.forceStopped = this.forceStopped, this.results.median = this.median(), 
                    this.results.variance = this.variance(), this.results.endTimestamp = j.getCurrent();
                }
            }, {
                key: "median",
                value: function() {
                    if (0 == this.rtts.length) return null;
                    this.rtts.sort();
                    var a = Math.floor(this.rtts.length / 2);
                    return this.rtts[a];
                }
            }, {
                key: "variance",
                value: function() {
                    if (0 == this.rtts.length) return null;
                    for (var a = 0, b = this.median(), c = 0; c < this.rtts.length; c++) {
                        var d = this.rtts[c];
                        a += Math.abs(d - b);
                    }
                    return a /= this.rtts.length;
                }
            }, {
                key: "stop",
                value: function() {
                    this.isActive() && (h(b.prototype.__proto__ || Object.getPrototypeOf(b.prototype), "stop", this).call(this), 
                    this.fillResults());
                }
            } ]), b;
        }();
        c.RttTest = l;
    }, {
        "../utility/timestamps": 14,
        "./turnTest": 5
    } ],
    4: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        function e(a, b) {
            if (!a) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
            return !b || "object" != typeof b && "function" != typeof b ? a : b;
        }
        function f(a, b) {
            if ("function" != typeof b && null !== b) throw new TypeError("Super expression must either be null or a function, not " + typeof b);
            a.prototype = Object.create(b && b.prototype, {
                constructor: {
                    value: a,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), b && (Object.setPrototypeOf ? Object.setPrototypeOf(a, b) : a.__proto__ = b);
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.ThroughputTest = void 0;
        var g = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), h = function a(b, c, d) {
            null === b && (b = Function.prototype);
            var e = Object.getOwnPropertyDescriptor(b, c);
            if (void 0 === e) {
                var f = Object.getPrototypeOf(b);
                return null === f ? void 0 : a(f, c, d);
            }
            if ("value" in e) return e.value;
            var g = e.get;
            return void 0 !== g ? g.call(d) : void 0;
        }, i = a("../utility/timestamps"), j = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(i), k = a("../utility/messageMaker"), l = a("./turnTest"), m = function(a) {
            function b(a, c) {
                d(this, b);
                var f = e(this, (b.__proto__ || Object.getPrototypeOf(b)).call(this, a));
                if (f.sentBytes = 0, f.receivedBytes = 0, f.secondHalfBytes = 0, f.secondHalfStart = null, 
                f.bufferEmpty = 0, f.chunkSize = 1200, f.messageMaker = new k.MessageMaker(f.chunkSize), 
                f.duration = 5e3, null != c) {
                    var g = 50 * c;
                    f.duration = Math.max(Math.min(g, 1e4), 1e3);
                }
                return f.sendTimer = null, f.lastMessage = null, f.intervals = [], f.intervalStart = 0, 
                f.intervalLength = 100, f.intervalBytes = 0, f;
            }
            return f(b, l.TurnTest), g(b, [ {
                key: "initiate",
                value: function() {
                    if (window && window.csioReactNative) {
                        this.handleError(new Error("Not running throughput test for react-native"));
                    } else this.startSend();
                }
            }, {
                key: "handleMessage",
                value: function(a) {
                    var b = this;
                    if (this.isActive()) {
                        this.lastMessage = a, this.receivedBytes += a.length;
                        var c = j.getCurrent();
                        if (this.sendTimer || (this.results.startTimestamp = c, this.sendTimer = setTimeout(function() {
                            b.stop(), b.finished();
                        }, this.duration)), 0 == this.intervalStart && (this.intervalStart = c), this.intervalBytes += a.length, 
                        c - this.intervalStart >= this.intervalLength) {
                            var d = c - this.intervalStart, e = this.averageThroughput(this.intervalBytes, d), f = null;
                            try {
                                f = c - JSON.parse(this.lastMessage).timestamp;
                            } catch (a) {}
                            this.intervals.push({
                                startTimestamp: this.intervalStart,
                                endTimestamp: c,
                                bytesReceived: this.intervalBytes,
                                average: e,
                                rtt: f
                            }), this.intervalStart = c, this.intervalBytes = 0;
                        }
                        this.results.startTimestamp && c - this.results.startTimestamp > this.duration / 2 && (this.secondHalfStart || (this.secondHalfStart = c), 
                        this.secondHalfBytes += a.length);
                    }
                }
            }, {
                key: "handleError",
                value: function(a) {
                    this.stop(), this.failed(a);
                }
            }, {
                key: "averageThroughput",
                value: function(a, b) {
                    return a / (b / 1e3) * 8 / 1024;
                }
            }, {
                key: "bufferListener",
                value: function() {
                    this.sendChannel.removeEventListener("bufferedamountlow", this.bufferListener.bind(this)), 
                    this.fillBuffer();
                }
            }, {
                key: "fillBuffer",
                value: function() {
                    for (0 == this.sendChannel.bufferedAmount && (this.bufferEmpty += 1); this.isActive(); ) {
                        if (this.sendChannel.bufferedAmount > this.bufferFullThreshold) return void (this.usePolling ? setTimeout(this.fillBuffer.bind(this), 250) : this.sendChannel.addEventListener("bufferedamountlow", this.bufferListener.bind(this)));
                        var a = this.messageMaker.make(this.sentBytes);
                        this.sentBytes += a.length, this.send(a);
                    }
                    this.sendChannel.removeEventListener("bufferedamountlow", this.bufferListener.bind(this));
                }
            }, {
                key: "startSend",
                value: function() {
                    this.isActive() && (this.bufferFullThreshold = 1e3 * this.chunkSize, this.sendChannel = this.connection.sendChannel, 
                    this.usePolling = !0, "number" == typeof this.sendChannel.bufferedAmountLowThreshold && (this.usePolling = !1, 
                    this.sendChannel.bufferedAmountLowThreshold = this.bufferFullThreshold / 10), setTimeout(this.fillBuffer.bind(this), 0));
                }
            }, {
                key: "fillResults",
                value: function() {
                    this.results.endTimestamp = j.getCurrent(), this.results.maxDuration = this.duration, 
                    this.results.forceStopped = this.forceStopped, this.results.bufferEmpty = this.bufferEmpty, 
                    this.results.intervals = this.intervals, this.results.bytesPrepared = this.sentBytes, 
                    this.results.bytesReceived = this.receivedBytes;
                    var a = 0, b = 0;
                    this.secondHalfStart && (a = this.results.endTimestamp - this.secondHalfStart, b = this.averageThroughput(this.secondHalfBytes, a));
                    var c = this.results.endTimestamp - this.results.startTimestamp, d = this.averageThroughput(this.receivedBytes, c);
                    d > b && (b = d), this.results.average = b;
                    var e = null;
                    try {
                        e = JSON.parse(this.lastMessage);
                    } catch (a) {
                        return;
                    }
                    if (e) {
                        var f = e.sentBytes + this.lastMessage.length;
                        this.results.bytesSent = f, this.results.fractionLostBytes = 1 - this.receivedBytes / f;
                    } else this.results.bytesSent = -1, this.results.fractionLostBytes = -1;
                }
            }, {
                key: "stop",
                value: function() {
                    this.isActive() && (clearTimeout(this.sendTimer), this.sendTimer = null, h(b.prototype.__proto__ || Object.getPrototypeOf(b.prototype), "stop", this).call(this), 
                    this.fillResults());
                }
            } ]), b;
        }();
        c.ThroughputTest = m;
    }, {
        "../utility/messageMaker": 7,
        "../utility/timestamps": 14,
        "./turnTest": 5
    } ],
    5: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        });
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("bluebird"), g = function() {
            function a(b) {
                d(this, a), this.connection = b, this.active = !1, this.results = {};
            }
            return e(a, [ {
                key: "getResults",
                value: function() {
                    return this.results;
                }
            }, {
                key: "start",
                value: function() {
                    var a = this, b = new f(function(b, c) {
                        a.resolveCb = b, a.rejectCb = c;
                    });
                    return this.connection.setMessageCallback(this.handleMessage.bind(this)), this.connection.setErrorCallback(this.handleError.bind(this)), 
                    this.active = !0, this.forceStopped = !1, this.initiate(), b;
                }
            }, {
                key: "stop",
                value: function() {
                    this.active = !1;
                }
            }, {
                key: "forceStop",
                value: function() {
                    this.forceStopped = !0, this.stop(), this.finished();
                }
            }, {
                key: "isActive",
                value: function() {
                    return this.active;
                }
            }, {
                key: "initiate",
                value: function() {}
            }, {
                key: "handleMessage",
                value: function(a) {}
            }, {
                key: "handleError",
                value: function(a) {}
            }, {
                key: "send",
                value: function(a) {
                    this.connection.send(a);
                }
            }, {
                key: "finished",
                value: function() {
                    this.active = !1, this.resolveCb && (this.resolveCb(), this.resolveCb = null);
                }
            }, {
                key: "failed",
                value: function(a) {
                    this.active = !1, this.rejectCb && (this.rejectCb(a), this.rejectCb = null);
                }
            } ]), a;
        }();
        c.TurnTest = g;
    }, {
        bluebird: 1
    } ],
    6: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.TurnConnection = void 0;
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("./utility/parsedIceCandidate"), g = a("./utility/stats/getstatshandler"), h = a("./utility/stats/detectbrowser"), i = a("bluebird"), j = function() {
            function a(b) {
                d(this, a), this.reset(), this.statshandler = new g.GetStatsHandler(b);
            }
            return e(a, [ {
                key: "reset",
                value: function() {
                    this.disconnect(), this.iceServers = null, this.pctpc1 = null, this.pctpc2 = null, 
                    this.sendChannel = null, this.messageCallback = null, this.errorCallback = null, 
                    this.parsedIceResults = {}, this.resolveCb = null, this.rejectCb = null;
                }
            }, {
                key: "setMessageCallback",
                value: function(a) {
                    this.messageCallback = a;
                }
            }, {
                key: "setErrorCallback",
                value: function(a) {
                    this.errorCallback = a;
                }
            }, {
                key: "send",
                value: function(a) {
                    if (this.sendChannel) try {
                        this.sendChannel.send(a);
                    } catch (a) {
                        this.raiseSendError(a);
                    } else this.raiseSendError(new Error("No send channel"));
                }
            }, {
                key: "raiseSendError",
                value: function(a) {
                    this.errorCallback && this.errorCallback(a);
                }
            }, {
                key: "assignEvent",
                value: function(a, b, c) {
                    a.addEventListener ? a.addEventListener(b, c.bind(this), !1) : a.attachEvent && (b = "on" + b, 
                    a.attachEvent(b, c.bind(this)));
                }
            }, {
                key: "connect",
                value: function(a) {
                    var b = this;
                    this.reset();
                    var c = new i(function(a, c) {
                        b.resolveCb = a, b.rejectCb = c;
                    });
                    this.iceServers = a;
                    var d = null;
                    try {
                        if (RTCPeerConnection ? d = RTCPeerConnection : webkitRTCPeerConnection ? d = webkitRTCPeerConnection : mozRTCPeerConnection ? d = mozRTCPeerConnection : window && window.RTCPeerConnection && (d = window.RTCPeerConnection), 
                        !d) {
                            var e = new Error("RTCPeerConnection not found");
                            return e.continueFlag = !1, this.rejectCb(e), c;
                        }
                    } catch (e) {
                        return e.continueFlag = !1, this.rejectCb(e), c;
                    }
                    var f = {
                        ordered: !1,
                        maxRetransmits: 0
                    }, g = {
                        iceTransportPolicy: "all",
                        iceServers: this.iceServers
                    };
                    try {
                        this.pctpc1 = new d(g), this.pctpc2 = new d(g);
                    } catch (e) {
                        return this.rejectDisconnect(!1, e), c;
                    }
                    this.connectionTimer = setTimeout(function() {
                        delete b.connectionTimer, b.rejectDisconnect(!1, new Error("Connection timeout"));
                    }, 3e4);
                    try {
                        this.sendChannel = this.pctpc1.createDataChannel("precalltest", f), this.sendChannel.binaryType = "arraybuffer", 
                        this.assignEvent(this.sendChannel, "error", function(a) {
                            b.raiseSendError(a), b.rejectDisconnect(!0, a);
                        }), this.assignEvent(this.pctpc2, "datachannel", function(a) {
                            var c = a.channel;
                            b.assignEvent(c, "open", function(a) {
                                b.resolveCb && (b.resolveCb(), b.resolveCb = null);
                            }), b.assignEvent(c, "close", function(a) {
                                b && b.disconnect && b.disconnect();
                            }), b.assignEvent(c, "message", function(a) {
                                b.messageCallback && b.messageCallback(a.data);
                            }), b.assignEvent(c, "error", function(a) {
                                b.errorCallback && b.errorCallback(a), b.rejectDisconnect(!0, a);
                            });
                        });
                    } catch (e) {
                        return this.rejectDisconnect(!1, e), c;
                    }
                    try {
                        this.assignEvent(this.pctpc1, "icecandidate", function(a) {
                            b.onIceCandidate(b.pctpc1, a);
                        }), this.assignEvent(this.pctpc1, "iceconnectionstatechange", function(a) {
                            b.onIceStateChange(b.pctpc1, a);
                        }), this.assignEvent(this.pctpc2, "icecandidate", function(a) {
                            b.onIceCandidate(b.pctpc2, a);
                        }), this.assignEvent(this.pctpc2, "iceconnectionstatechange", function(a) {
                            b.onIceStateChange(b.pctpc2, a);
                        }), this.pctpc1.createOffer().then(function(a, c) {
                            b.onCreateOfferSuccess(a);
                        }, function(a) {
                            b.onCreateOfferError(b.pctpc1, a);
                        });
                    } catch (e) {
                        return this.rejectDisconnect(!1, e), c;
                    }
                    return c;
                }
            }, {
                key: "rejectDisconnect",
                value: function(a, b) {
                    this.disconnect(), this.rejectCb && (b.continueFlag = a, this.rejectCb(b)), this.resolveCb = null, 
                    this.rejectCb = null;
                }
            }, {
                key: "disconnect",
                value: function() {
                    if (clearTimeout(this.connectionTimer), clearTimeout(this.iceTimer), this.pctpc1) try {
                        this.pctpc1.close();
                    } catch (a) {}
                    if (this.pctpc1 = null, this.pctpc2) try {
                        this.pctpc2.close();
                    } catch (a) {}
                    this.pctpc2 = null;
                }
            }, {
                key: "getName",
                value: function(a) {
                    return a === this.pctpc1 ? "pctpc1" : "pctpc2";
                }
            }, {
                key: "getOtherPc",
                value: function(a) {
                    return a === this.pctpc1 ? this.pctpc2 : this.pctpc1;
                }
            }, {
                key: "onCreateOfferError",
                value: function(a, b) {
                    this.rejectDisconnect(!1, b);
                }
            }, {
                key: "onCreateAnswerError",
                value: function(a, b) {
                    this.rejectDisconnect(!1, b);
                }
            }, {
                key: "onCreateOfferSuccess",
                value: function(a) {
                    var b = this;
                    try {
                        this.pctpc1.setLocalDescription(a).then(function() {
                            b.onSetLocalSuccess(b.pctpc1);
                        }, function(a) {
                            b.onSetSessionDescriptionError(b.pctpc1, a);
                        }), this.pctpc2.setRemoteDescription(a).then(function() {
                            b.onSetRemoteSuccess(b.pctpc2);
                        }, function(a) {
                            b.onSetRemoteSessionDescriptionError(b.pctpc2, a);
                        }), this.pctpc2.createAnswer().then(function(a) {
                            b.onCreateAnswerSuccess(a);
                        }, function(a) {
                            b.onCreateAnswerError(b.pctpc2, a);
                        });
                    } catch (a) {
                        this.rejectDisconnect(!1, a);
                    }
                }
            }, {
                key: "onSetLocalSuccess",
                value: function(a) {}
            }, {
                key: "onSetRemoteSuccess",
                value: function(a) {}
            }, {
                key: "onSetSessionDescriptionError",
                value: function(a, b) {
                    this.rejectDisconnect(!1, b);
                }
            }, {
                key: "onSetRemoteSessionDescriptionError",
                value: function(a, b) {
                    this.rejectDisconnect(!1, b);
                }
            }, {
                key: "onCreateAnswerSuccess",
                value: function(a) {
                    var b = this;
                    try {
                        this.pctpc2.setLocalDescription(a).then(function() {
                            b.onSetLocalSuccess(b.pctpc2);
                        }, function(a) {
                            b.onSetSessionDescriptionError(b.pctpc2, a);
                        }), this.pctpc1.setRemoteDescription(a).then(function() {
                            b.onSetRemoteSuccess(b.pctpc1);
                        }, function(a) {
                            b.onSetRemoteSessionDescriptionError(b.pctpc1, a);
                        });
                    } catch (a) {
                        this.rejectDisconnect(!1, a);
                    }
                }
            }, {
                key: "onIceCandidate",
                value: function(a, b) {
                    var c = this;
                    try {
                        if (!b.candidate) return;
                        var d = new f.ParsedIceCandidate(b.candidate);
                        if (a == this.pctpc1 && this.statshandler.codeBase == h.Constants.codeBaseType.chrome && (d.isRelay() && (d.isTypeTransportUdp() && (this.parsedIceResults.relayUdpGathered = !0), 
                        d.isTypeTransportTcp() && (this.parsedIceResults.relayTcpGathered = !0), d.isTypeTransportTls() && (this.parsedIceResults.relayTlsGathered = !0)), 
                        d.isServerReflexive() && (this.parsedIceResults.srflxGathered = !0)), !d.isRelay()) return;
                        this.getOtherPc(a).addIceCandidate(b.candidate).then(function() {
                            c.onAddIceCandidateSuccess(a);
                        }, function(b) {
                            c.onAddIceCandidateError(a, b, d.isRelay());
                        });
                    } catch (a) {
                        this.rejectDisconnect(!1, a);
                    }
                }
            }, {
                key: "onAddIceCandidateSuccess",
                value: function(a) {}
            }, {
                key: "onAddIceCandidateError",
                value: function(a, b, c) {
                    c && this.rejectDisconnect(!1, b);
                }
            }, {
                key: "onIceStateChange",
                value: function(a, b) {
                    var c = this;
                    try {
                        var d = "(?)";
                        a && (d = a.iceConnectionState), "failed" === d && this.rejectDisconnect(!0, new Error("ICE failure")), 
                        "checking" !== d || this.iceTimer || (this.iceTimer = setTimeout(function() {
                            delete c.iceTimer, c.rejectDisconnect(!0, new Error("ICE timeout"));
                        }, 1e4)), "completed" !== d && "connected" !== d || (clearTimeout(this.iceTimer), 
                        delete this.iceTimer);
                    } catch (a) {
                        this.rejectDisconnect(!1, a);
                    }
                }
            }, {
                key: "getIceResults",
                value: function() {
                    var a = this;
                    return new i(function(b, c) {
                        for (var d = JSON.parse(JSON.stringify(a.iceServers)), e = 0; e < d.length; e++) {
                            var f = d[e];
                            d.hasOwnProperty(f) || delete f.credential;
                        }
                        var g = {
                            turnIpAddress: "",
                            turnIpVersion: "",
                            turnTransport: "",
                            iceServers: d,
                            ipv6Supported: !1,
                            ipv4Supported: !1,
                            relayTlsGathered: !1,
                            relayTcpGathered: !1,
                            relayUdpGathered: !1,
                            srflxGathered: !1,
                            relayTlsSuccess: !1,
                            relayTcpSuccess: !1,
                            relayUdpSuccess: !1,
                            srflxSuccess: !1
                        };
                        for (var h in a.parsedIceResults) a.parsedIceResults.hasOwnProperty(h) && (g[h] = a.parsedIceResults[h]);
                        a.pctpc1 ? a.statshandler.getIceCandidates(a.pctpc1).then(function(a) {
                            for (var c = 0; c < a.iceCandidatePairs.length; c++) {
                                var d = a.iceCandidatePairs[c];
                                if (d.googActiveConnection || d.selected) for (var e = 0; e < a.localCandidates.length; e++) {
                                    var f = a.localCandidates[e], h = null;
                                    if (h = f.ip ? f.ip : f.ipAddress, f.id == d.localCandidateId) {
                                        g.turnIpAddress = h;
                                        var i = -1 !== h.indexOf(":");
                                        g.turnIpVersion = i ? "ipv6" : "ipv4", g.turnTransport = f.mozLocalTransport;
                                    }
                                    "relay" !== f.candidateType && "relayed" !== f.candidateType || ("udp" === f.mozLocalTransport && (g.relayUdpSuccess = !0), 
                                    "tcp" === f.mozLocalTransport && (g.relayTcpSuccess = !0), "tls" === f.mozLocalTransport && (g.relayTlsSuccess = !0)), 
                                    -1 !== h.indexOf(":") ? g.ipv6Supported = !0 : g.ipv4Supported = !0;
                                }
                            }
                            for (var j = 0; j < a.localCandidates.length; j++) {
                                var k = a.localCandidates[j];
                                "relay" !== k.candidateType && "relayed" !== k.candidateType || ("udp" === k.mozLocalTransport && (g.relayUdpGathered = !0), 
                                "tcp" === k.mozLocalTransport && (g.relayTcpGathered = !0), "tls" === k.mozLocalTransport && (g.relayTlsGathered = !0)), 
                                "srflx" !== k.candidateType && "serverreflexive" !== k.candidateType || (g.srflxGathered = !0);
                            }
                            for (var l = 0; l < a.iceCandidatePairs.length; l++) {
                                var m = a.iceCandidatePairs[l];
                                if ("succeeded" === m.state) for (var n = 0; n < a.localCandidates.length; n++) {
                                    var o = a.localCandidates[n];
                                    o.id == m.localCandidateId && ("relay" !== o.candidateType && "relayed" !== o.candidateType || ("udp" === o.mozLocalTransport && (g.relayUdpSuccess = !0), 
                                    "tcp" === o.mozLocalTransport && (g.relayTcpSuccess = !0), "tls" === o.mozLocalTransport && (g.relayTlsSuccess = !0)), 
                                    "srflx" !== o.candidateType && "serverreflexive" !== o.candidateType || (g.srflxSuccess = !0));
                                }
                            }
                            b(g);
                        }, function(a) {
                            c(a);
                        }) : c(new Error("PC not available for stats"));
                    }, function(a) {
                        reject(a);
                    });
                }
            } ]), a;
        }();
        c.TurnConnection = j;
    }, {
        "./utility/parsedIceCandidate": 9,
        "./utility/stats/detectbrowser": 11,
        "./utility/stats/getstatshandler": 12,
        bluebird: 1
    } ],
    7: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        function e(a) {
            for (var b = "", c = 0; c < a; c++) b += String.fromCharCode(35 + 58 * Math.random());
            return b;
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.randomAsciiString = c.MessageMaker = void 0;
        var f = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), g = a("../utility/timestamps"), h = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(g), i = function() {
            function a() {
                var b = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 1200;
                d(this, a), this.message = {
                    timestamp: "",
                    sentBytes: 1e4,
                    padding: ""
                };
                var c = e(b - h.getCurrent().toString().length - JSON.stringify(this.message).length);
                this.message.padding = c;
            }
            return f(a, [ {
                key: "make",
                value: function(a) {
                    return this.message.timestamp = h.getCurrent(), this.message.sentBytes = a, JSON.stringify(this.message);
                }
            } ]), a;
        }();
        c.MessageMaker = i, c.randomAsciiString = e;
    }, {
        "../utility/timestamps": 14
    } ],
    8: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.OnlineCheck = void 0;
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("./timestamps"), g = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(f), h = function() {
            function a() {
                d(this, a), this.active = !1;
            }
            return e(a, [ {
                key: "start",
                value: function() {
                    var a = this;
                    this.active = !0, this.onlineCheck = [], window && window.addEventListener && "function" == typeof window.addEventListener && (window.addEventListener("offline", function() {
                        a.addEntry();
                    }), window.addEventListener("online", function() {
                        a.addEntry();
                    }), this.addEntry());
                }
            }, {
                key: "addEntry",
                value: function() {
                    if (this.active) {
                        var a = g.getCurrent();
                        if (navigator && navigator.onLine) {
                            var b = navigator.onLine;
                            this.onlineCheck.push({
                                timestamp: a,
                                online: b
                            });
                        }
                    }
                }
            }, {
                key: "stop",
                value: function() {
                    var a = this;
                    return this.active = !1, window && window.removeEventListener && "function" == typeof window.removeEventListener && (window.removeEventListener("offline", function() {
                        a.addEntry();
                    }), window.removeEventListener("online", function() {
                        a.addEntry();
                    })), this.onlineCheck;
                }
            } ]), a;
        }();
        c.OnlineCheck = h;
    }, {
        "./timestamps": 14
    } ],
    9: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        });
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = function() {
            function a(b) {
                d(this, a), this.iceCandidateStr = b.candidate, this.parse();
            }
            return e(a, [ {
                key: "parse",
                value: function() {
                    var a = this.iceCandidateStr.split(" ");
                    a.length < 8 || (this.protocol = "1" === a[1] ? "rtp" : "rtcp", this.transport = a[2], 
                    this.typeTransport = this.extractTypeTransport(a[3]), this.ipv6 = -1 !== a[4].indexOf(":"), 
                    this.ipAddress = a[4], this.port = a[5], this.type = a[7]);
                }
            }, {
                key: "extractTypeTransport",
                value: function(a) {
                    var b = "None", c = a >> 24;
                    if ("rtp" === this.protocol && c >= 0 && c <= 2) switch (c) {
                      case 0:
                        b = "TLS";
                        break;

                      case 1:
                        b = "TCP";
                        break;

                      case 2:
                        b = "UDP";
                    }
                    return b;
                }
            }, {
                key: "getString",
                value: function() {
                    return this.iceCandidateStr;
                }
            }, {
                key: "getType",
                value: function() {
                    return this.type;
                }
            }, {
                key: "isHost",
                value: function() {
                    return "host" === this.type.toLowerCase();
                }
            }, {
                key: "isServerReflexive",
                value: function() {
                    return "srflx" === this.type.toLowerCase();
                }
            }, {
                key: "isPeerReflexive",
                value: function() {
                    return "prflx" === this.type.toLowerCase();
                }
            }, {
                key: "isRelay",
                value: function() {
                    return "relay" === this.type.toLowerCase() || "relayed" === this.type.toLowerCase();
                }
            }, {
                key: "getTypeTransport",
                value: function() {
                    return this.typeTransport;
                }
            }, {
                key: "isTypeTransportUdp",
                value: function() {
                    return "UDP" === this.typeTransport;
                }
            }, {
                key: "isTypeTransportTcp",
                value: function() {
                    return "TCP" === this.typeTransport;
                }
            }, {
                key: "isTypeTransportTls",
                value: function() {
                    return "TLS" === this.typeTransport;
                }
            }, {
                key: "getTransport",
                value: function() {
                    return this.transport;
                }
            }, {
                key: "isUdp",
                value: function() {
                    return "udp" === this.transport.toLowerCase();
                }
            }, {
                key: "isTcp",
                value: function() {
                    return "tcp" === this.transport.toLowerCase();
                }
            }, {
                key: "getProtocol",
                value: function() {
                    return this.protocol;
                }
            }, {
                key: "isRtp",
                value: function() {
                    return "rtp" === this.protocol;
                }
            }, {
                key: "isRtcp",
                value: function() {
                    return "rtcp" === this.protocol;
                }
            }, {
                key: "isIpv6",
                value: function() {
                    return this.ipv6;
                }
            }, {
                key: "getIpAddress",
                value: function() {
                    return this.ipAddress;
                }
            }, {
                key: "getPort",
                value: function() {
                    return this.port;
                }
            } ]), a;
        }();
        c.ParsedIceCandidate = f;
    }, {} ],
    10: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.ResultsHandler = void 0;
        var e = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(a) {
            return typeof a;
        } : function(a) {
            return a && "function" == typeof Symbol && a.constructor === Symbol && a !== Symbol.prototype ? "symbol" : typeof a;
        }, f = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), g = a("./timestamps"), h = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(g), i = a("./messageMaker"), j = function() {
            function a() {
                d(this, a), this.start = h.getCurrent(), this.id = Math.trunc(this.start) + "-" + (0, 
                i.randomAsciiString)(20), this.version = "1.2.0", this.failures = [], this.results = {}, 
                this.forceStopped = !1;
            }
            return f(a, [ {
                key: "getResults",
                value: function() {
                    return {
                        id: this.id,
                        version: this.version,
                        forceStopped: this.forceStopped,
                        startTimestamp: this.start,
                        endTimestamp: h.getCurrent(),
                        failures: this.failures,
                        tests: this.results
                    };
                }
            }, {
                key: "getFailureNumber",
                value: function() {
                    return this.failures.length;
                }
            }, {
                key: "getId",
                value: function() {
                    return this.id;
                }
            }, {
                key: "add",
                value: function(a, b) {
                    this.results[a] = b, b.forceStopped && !0 === b.forceStopped && (this.forceStopped = !0);
                }
            }, {
                key: "failure",
                value: function(a) {
                    "object" === (void 0 === a ? "undefined" : e(a)) && (a = a.toString());
                    var b = {
                        timestamp: h.getCurrent(),
                        reason: a
                    };
                    this.failures.push(b);
                }
            } ]), a;
        }();
        c.ResultsHandler = j;
    }, {
        "./messageMaker": 7,
        "./timestamps": 14
    } ],
    11: [ function(a, b, c) {
        "use strict";
        function d() {
            var a = e.browserName.chrome, b = null, c = null, d = null, f = e.codeBaseType.chrome;
            if (window && (!window.navigator || !window.navigator.userAgent || window.csioReactNative)) return window && window.csioGetOsName && (b = window.csioGetOsName()), 
            window && window.csioGetOsVer && (c = window.csioGetOsVer()), window && window.csioReactNative && (d = "react-native"), 
            {
                browserName: a,
                codeBase: f,
                os: b,
                osVersion: c,
                userAgent: d
            };
            var g = (d = navigator.userAgent).toLowerCase(), h = navigator.appVersion, i = "" + parseFloat(navigator.appVersion), j = void 0;
            -1 !== (j = g.indexOf("opera")) ? (a = e.browserName.opera, i = g.substring(j + 6), 
            -1 !== (j = g.indexOf("Version")) && (i = g.substring(j + 8)), f = e.codeBaseType.chrome) : -1 !== (j = g.indexOf("opr")) ? (a = e.browserName.opera, 
            i = g.substring(j + 4), -1 !== (j = g.indexOf("Version")) && (i = g.substring(j + 8)), 
            f = e.codeBaseType.chrome) : -1 !== (j = g.indexOf("msie")) ? (a = e.browserName.msie, 
            i = g.substring(j + 5), f = e.codeBaseType.chrome) : -1 !== (j = g.indexOf("edge")) ? (a = e.browserName.edge, 
            i = g.substring(j + 5), f = e.codeBaseType.edge) : -1 !== (j = g.indexOf("chrome")) ? (a = e.browserName.chrome, 
            i = g.substring(j + 7), f = e.codeBaseType.chrome) : -1 !== (j = g.indexOf("safari")) ? (a = e.browserName.safari, 
            i = g.substring(j + 7), -1 !== (j = g.indexOf("Version")) && (i = g.substring(j + 8)), 
            f = e.codeBaseType.chrome) : -1 !== (j = g.indexOf("firefox")) ? (a = e.browserName.firefox, 
            i = g.substring(j + 8), f = e.codeBaseType.firefox) : -1 !== (j = g.indexOf("trident")) && (a = e.browserName.msie, 
            j = g.indexOf("rv"), i = g.substring(j + 3, j + 7), f = e.codeBaseType.chrome);
            var k = [ {
                s: "Windows 3.11",
                r: /win16/
            }, {
                s: "Windows 95",
                r: /(windows 95|win95|windows_95)/
            }, {
                s: "Windows ME",
                r: /(win 9x 4.90|windows me)/
            }, {
                s: "Windows 98",
                r: /(windows 98|win98)/
            }, {
                s: "Windows CE",
                r: /windows ce/
            }, {
                s: "Windows 2000",
                r: /(windows nt 5.0|windows 2000)/
            }, {
                s: "Windows XP",
                r: /(windows nt 5.1|windows xp)/
            }, {
                s: "Windows Server 2003",
                r: /windows nt 5.2/
            }, {
                s: "Windows Vista",
                r: /windows nt 6.0/
            }, {
                s: "Windows 7",
                r: /(windows 7|windows nt 6.1)/
            }, {
                s: "Windows 8.1",
                r: /(windows 8.1|windows nt 6.3)/
            }, {
                s: "Windows 8",
                r: /(windows 8|windows nt 6.2)/
            }, {
                s: "Windows 10",
                r: /(windows 10|windows nt 10.0)/
            }, {
                s: "Windows NT 4.0",
                r: /(windows nt 4.0|winnt4.0|winnt|windows nt)/
            }, {
                s: "Windows ME",
                r: /windows me/
            }, {
                s: "Android",
                r: /android/
            }, {
                s: "Open BSD",
                r: /openbsd/
            }, {
                s: "Sun OS",
                r: /sunos/
            }, {
                s: "Linux",
                r: /(linux|x11)/
            }, {
                s: "iOS",
                r: /(iphone|ipad|ipod)/
            }, {
                s: "Mac OS X",
                r: /mac os x/
            }, {
                s: "Mac OS",
                r: /(macppc|macintel|mac_powerpc|macintosh)/
            }, {
                s: "QNX",
                r: /qnx/
            }, {
                s: "UNIX",
                r: /unix/
            }, {
                s: "BeOS",
                r: /beos/
            }, {
                s: "OS/2",
                r: /os\/2/
            }, {
                s: "Search Bot",
                r: /(nuhk|googlebot|yammybot|openbot|slurp|msnbot|ask jeeves\/teoma|ia_archiver)/
            } ], l = void 0, m = void 0;
            for (l in k) if (k.hasOwnProperty(l) && (m = k[l]).r.test(g)) {
                b = m.s;
                break;
            }
            switch (b && /Windows/.test(b) && (c = /Windows (.*)/.exec(b)[1], b = e.osName.windows), 
            b) {
              case e.osName.mac:
                c = /mac os x (10[\.\_\d]+)/.exec(g)[1];
                break;

              case e.osName.android:
                c = /android ([\.\_\d]+)/.exec(g)[1];
                break;

              case e.osName.ios:
                c = (c = /os (\d+)_(\d+)_?(\d+)?/.exec(h))[1] + "." + c[2] + "." + (0 | c[3]);
            }
            return {
                browserName: a,
                browserVersion: i.toString(),
                os: b,
                osVersion: c,
                codeBase: f,
                userAgent: d
            };
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.detect = d;
        var e = c.Constants = {
            codeBaseType: {
                chrome: "Chrome",
                firefox: "Firefox",
                edge: "Edge",
                plugin: "Plugin"
            },
            browserName: {
                chrome: "Chrome",
                firefox: "Firefox",
                edge: "Edge",
                msie: "Microsoft Internet Explorer",
                safari: "Safari"
            },
            osName: {
                windows: "Windows",
                mac: "Mac OS X",
                android: "Android",
                ios: "iOS"
            }
        };
    }, {} ],
    12: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.GetStatsHandler = void 0;
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("./detectbrowser"), g = a("./statsadapter"), h = a("bluebird"), i = function() {
            function a(b) {
                d(this, a), this.codeBase = b.codeBase, this.browserName = b.browserName, this.adapter = new g.StatsAdapter(this.codeBase, this.browserName), 
                this.isPromiseBased = !0;
            }
            return e(a, [ {
                key: "getIceCandidates",
                value: function(a) {
                    var b = this;
                    return new h(function(c, d) {
                        b.csioGetStats(b.iceCandidatesHandler.bind(b), a, function(a) {
                            c(a);
                        });
                    });
                }
            }, {
                key: "iceCandidatesHandler",
                value: function(a, b) {
                    b(this.adapter.getIceCandidates(a));
                }
            }, {
                key: "csioGetStats",
                value: function(a, b, c) {
                    var d = f.Constants.codeBaseType.firefox, e = f.Constants.codeBaseType.chrome, g = f.Constants.codeBaseType.edge, h = f.Constants.browserName.safari;
                    b && (this.codeBase === d ? this.getStatsFirefox(a, b, c) : this.browserName === h ? this.getStatsSafari(a, b, c) : this.codeBase === e ? this.getStatsChrome(a, b, c) : this.codeBase === g && this.getStatsEdge(a, b, c));
                }
            }, {
                key: "getStatsFirefox",
                value: function(a, b, c) {
                    var d = this;
                    if (d.isPromiseBased) try {
                        b.getStats().then(function(b) {
                            a(b, c);
                        }).catch(function(e) {
                            d.isPromiseBased = !1, b.getStats(null, function(b) {
                                a(b, c);
                            }, function() {});
                        });
                    } catch (e) {
                        d.isPromiseBased = !1, b.getStats(null, function(b) {
                            a(b, c);
                        }, function() {});
                    } else b.getStats(null, function(b) {
                        a(b, c);
                    }, function() {});
                }
            }, {
                key: "getStatsChrome",
                value: function(a, b, c) {
                    var d = this;
                    if (window && window.csioReactNative) b.getStats(null, function(b) {
                        a(b, c);
                    }, function(a) {}); else if (d.isPromiseBased) try {
                        b.getStats().then(function(b) {
                            a(b, c);
                        }).catch(function(e) {
                            d.isPromiseBased = !1, b.getStats(function(b) {
                                a(b, c);
                            });
                        });
                    } catch (d) {
                        isPromiseBased = !1, b.getStats(function(b) {
                            a(b, c);
                        });
                    } else b.getStats(function(b) {
                        a(b, c);
                    });
                }
            }, {
                key: "getStatsEdge",
                value: function(a, b, c) {
                    b.getStats().then(function(b) {
                        a(b, c);
                    }).catch(function(a) {});
                }
            }, {
                key: "getStatsSafari",
                value: function(a, b, c) {
                    b.getStats().then(function(b) {
                        a(b, c);
                    }).catch(function(a) {});
                }
            } ]), a;
        }();
        c.GetStatsHandler = i;
    }, {
        "./detectbrowser": 11,
        "./statsadapter": 13,
        bluebird: 1
    } ],
    13: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.StatsAdapter = void 0;
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("./detectbrowser"), g = function() {
            function a(b, c) {
                d(this, a), this.codeBase = b, this.browser = c;
            }
            return e(a, [ {
                key: "getIceCandidates",
                value: function(a) {
                    if (!a) return null;
                    var b = this.extractRawStats(a);
                    return this.processRawStatsForIceInfo(b);
                }
            }, {
                key: "extractRawStats",
                value: function(a) {
                    var b = [], c = void 0, d = f.Constants.codeBaseType.firefox, e = f.Constants.codeBaseType.chrome, g = f.Constants.browserName.safari;
                    if (this.codeBase === d && this.browser !== g) a.forEach(function(a) {
                        b.push(a);
                    }); else if (this.codeBase === e && this.browser !== g) a && a.result ? b = a.result() : a && a.forEach && (b = [], 
                    a.forEach(function(a) {
                        b.push(a);
                    })); else for (c in a) a.hasOwnProperty(c) && b.push(a[c]);
                    return b;
                }
            }, {
                key: "processRawStatsForIceInfo",
                value: function(a) {
                    var b = [], c = [], d = [], e = void 0;
                    if (!a) return null;
                    for (var f = 0; f < a.length; ++f) {
                        var g = this.getParsedStats(a[f]), h = this.statsClassifier(g);
                        if (h.candidatePair) d.push(h.candidatePair); else if (h.transportStats) {
                            if ("transport" === h.transportStats.type) {
                                e = h.transportStats.selectedCandidatePairId;
                                continue;
                            }
                            d.push(h.transportStats);
                        } else if (h.localCandidate) {
                            var i = h.localCandidate;
                            if ("relay" == i.candidateType || "relayed" == i.candidateType) {
                                if (!i.mozLocalTransport) {
                                    var j = i.priority >> 24;
                                    i.mozLocalTransport = this.formatRelayType(j);
                                }
                                i.mozLocalTransport = i.mozLocalTransport.toLowerCase();
                            }
                            b.push(i);
                        } else h.remoteCandidate && c.push(h.remoteCandidate);
                    }
                    if (e) for (var k = 0; k < d.length; ++k) d[k].id === e && (d[k].googActiveConnection = "true");
                    return {
                        localCandidates: b,
                        remoteCandidates: c,
                        iceCandidatePairs: d
                    };
                }
            }, {
                key: "getParsedStats",
                value: function(a) {
                    var b = {};
                    if (a.timestamp instanceof Date && (b.timestamp = a.timestamp.getTime().toString()), 
                    a.type && (b.type = a.type), a.names) for (var c = a.names(), d = 0; d < c.length; ++d) b[c[d]] = a.stat(c[d]); else Object.assign(b, a);
                    if (b.values) {
                        for (var e = 0; e < b.values.length; e++) {
                            var f = b.values[e];
                            Object.assign(b, f);
                        }
                        delete b.values;
                    }
                    return b;
                }
            }, {
                key: "statsClassifier",
                value: function(a) {
                    var b = {}, c = function() {
                        for (var b = arguments.length, c = Array(b), d = 0; d < b; d++) c[d] = arguments[d];
                        for (var e = 0; e < c.length; e++) {
                            var f = c[e];
                            if (a.type === f) return !0;
                        }
                        return !1;
                    }, d = c("inbound-rtp", "inboundrtp"), e = "true" === a.isRemote || !0 === a.isRemote;
                    return d || c("outbound-rtp", "outboundrtp") ? (b.tracks = {}, b.tracks.data = a, 
                    b.tracks.ssrc = a.ssrc, b.tracks.streamType = d ? "inbound" : "outbound", b.tracks.reportType = "local", 
                    void 0 !== a.isRemote && (b.tracks.reportType = e ? "remote" : "local")) : c("candidatepair") && a.selected ? b.transportStats = a : c("localcandidate", "local-candidate") ? b.localCandidate = a : c("remotecandidate", "remote-candidate") ? b.remoteCandidate = a : c("transport", "googCandidatePair") ? b.transportStats = a : c("VideoBwe") ? b.bwe = a : c("track") ? b.trackStats = a : c("candidate-pair") ? b.candidatePair = a : c("codec") ? b.codec = a : c("ssrc") && (b.tracks = {}, 
                    b.tracks.data = a, b.tracks.ssrc = a.ssrc, b.tracks.reportType = "local", b.tracks.streamType = a.bytesSent ? "outbound" : "inbound"), 
                    b;
                }
            }, {
                key: "formatRelayType",
                value: function(a) {
                    var b = "none";
                    switch (a) {
                      case 0:
                        b = "tls";
                        break;

                      case 1:
                        b = "tcp";
                        break;

                      case 2:
                        b = "udp";
                    }
                    return b;
                }
            } ]), a;
        }();
        c.StatsAdapter = g;
    }, {
        "./detectbrowser": 11
    } ],
    14: [ function(a, b, c) {
        "use strict";
        function d() {
            return window && window.performance && window.performance.now && window.performance.timing && window.performance.timing.navigationStart ? window.performance.now() + window.performance.timing.navigationStart : Date.now();
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.getCurrent = d;
    }, {} ],
    15: [ function(a, b, c) {
        function d() {
            throw new Error("setTimeout has not been defined");
        }
        function e() {
            throw new Error("clearTimeout has not been defined");
        }
        function f(a) {
            if (l === setTimeout) return setTimeout(a, 0);
            if ((l === d || !l) && setTimeout) return l = setTimeout, setTimeout(a, 0);
            try {
                return l(a, 0);
            } catch (b) {
                try {
                    return l.call(null, a, 0);
                } catch (b) {
                    return l.call(this, a, 0);
                }
            }
        }
        function g(a) {
            if (m === clearTimeout) return clearTimeout(a);
            if ((m === e || !m) && clearTimeout) return m = clearTimeout, clearTimeout(a);
            try {
                return m(a);
            } catch (b) {
                try {
                    return m.call(null, a);
                } catch (b) {
                    return m.call(this, a);
                }
            }
        }
        function h() {
            q && o && (q = !1, o.length ? p = o.concat(p) : r = -1, p.length && i());
        }
        function i() {
            if (!q) {
                var a = f(h);
                q = !0;
                for (var b = p.length; b; ) {
                    for (o = p, p = []; ++r < b; ) o && o[r].run();
                    r = -1, b = p.length;
                }
                o = null, q = !1, g(a);
            }
        }
        function j(a, b) {
            this.fun = a, this.array = b;
        }
        function k() {}
        var l, m, n = b.exports = {};
        !function() {
            try {
                l = "function" == typeof setTimeout ? setTimeout : d;
            } catch (a) {
                l = d;
            }
            try {
                m = "function" == typeof clearTimeout ? clearTimeout : e;
            } catch (a) {
                m = e;
            }
        }();
        var o, p = [], q = !1, r = -1;
        n.nextTick = function(a) {
            var b = new Array(arguments.length - 1);
            if (arguments.length > 1) for (var c = 1; c < arguments.length; c++) b[c - 1] = arguments[c];
            p.push(new j(a, b)), 1 !== p.length || q || f(i);
        }, j.prototype.run = function() {
            this.fun.apply(null, this.array);
        }, n.title = "browser", n.browser = !0, n.env = {}, n.argv = [], n.version = "", 
        n.versions = {}, n.on = k, n.addListener = k, n.once = k, n.off = k, n.removeListener = k, 
        n.removeAllListeners = k, n.emit = k, n.prependListener = k, n.prependOnceListener = k, 
        n.listeners = function(a) {
            return [];
        }, n.binding = function(a) {
            throw new Error("process.binding is not supported");
        }, n.cwd = function() {
            return "/";
        }, n.chdir = function(a) {
            throw new Error("process.chdir is not supported");
        }, n.umask = function() {
            return 0;
        };
    }, {} ],
    16: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        });
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = function() {
            function a() {
                var b = this;
                d(this, a), this.batteryManager = null, "function" == typeof navigator.getBattery && navigator.getBattery().then(function(a) {
                    b.batteryManager = a;
                });
            }
            return e(a, [ {
                key: "getLevel",
                value: function() {
                    return this.batteryManager ? this.batteryManager.level : -1;
                }
            }, {
                key: "getCharging",
                value: function() {
                    return this.batteryManager ? this.batteryManager.charging : null;
                }
            } ]), a;
        }();
        c.Battery = f;
    }, {} ],
    17: [ function(a, b, c) {
        "use strict";
        function d() {
            var a = f.browserName.chrome, b = null, c = null, d = null, e = null, g = f.codeBaseType.chrome;
            if (!window.navigator.userAgent || window.csioReactNative) return window && window.csioGetOsName && (b = window.csioGetOsName()), 
            window && window.csioGetOsVer && (c = window.csioGetOsVer()), window && window.csioReactNative && (d = "react-native"), 
            {
                browserName: a,
                codeBase: g,
                os: b,
                osVersion: c,
                userAgent: d,
                browserVersion: null
            };
            d = navigator.userAgent;
            var h = d.toLowerCase();
            e = navigator.appVersion;
            var i = e.toLowerCase(), j = "" + parseFloat(i), k = void 0;
            -1 !== (k = h.indexOf("opera")) ? (a = f.browserName.opera, j = h.substring(k + 6), 
            -1 !== (k = h.indexOf("Version")) && (j = h.substring(k + 8)), g = f.codeBaseType.chrome) : -1 !== (k = h.indexOf("opr")) ? (a = f.browserName.opera, 
            j = h.substring(k + 4), -1 !== (k = h.indexOf("Version")) && (j = h.substring(k + 8)), 
            g = f.codeBaseType.chrome) : -1 !== (k = h.indexOf("msie")) ? (a = f.browserName.msie, 
            j = h.substring(k + 5), g = f.codeBaseType.chrome) : -1 !== (k = h.indexOf("edge")) ? (a = f.browserName.edge, 
            j = h.substring(k + 5), g = f.codeBaseType.edge) : -1 !== (k = h.indexOf("chrome")) ? (a = f.browserName.chrome, 
            j = h.substring(k + 7), g = f.codeBaseType.chrome) : -1 !== (k = h.indexOf("safari")) ? (a = f.browserName.safari, 
            j = h.substring(k + 7), -1 !== (k = h.indexOf("Version")) && (j = h.substring(k + 8)), 
            g = f.codeBaseType.chrome) : -1 !== (k = h.indexOf("firefox")) ? (a = f.browserName.firefox, 
            j = h.substring(k + 8), g = f.codeBaseType.firefox) : -1 !== (k = h.indexOf("trident")) && (a = f.browserName.msie, 
            k = h.indexOf("rv"), j = h.substring(k + 3, k + 7), g = f.codeBaseType.chrome);
            var l = [ {
                s: "Windows 3.11",
                r: /win16/
            }, {
                s: "Windows 95",
                r: /(windows 95|win95|windows_95)/
            }, {
                s: "Windows ME",
                r: /(win 9x 4.90|windows me)/
            }, {
                s: "Windows 98",
                r: /(windows 98|win98)/
            }, {
                s: "Windows CE",
                r: /windows ce/
            }, {
                s: "Windows 2000",
                r: /(windows nt 5.0|windows 2000)/
            }, {
                s: "Windows XP",
                r: /(windows nt 5.1|windows xp)/
            }, {
                s: "Windows Server 2003",
                r: /windows nt 5.2/
            }, {
                s: "Windows Vista",
                r: /windows nt 6.0/
            }, {
                s: "Windows 7",
                r: /(windows 7|windows nt 6.1)/
            }, {
                s: "Windows 8.1",
                r: /(windows 8.1|windows nt 6.3)/
            }, {
                s: "Windows 8",
                r: /(windows 8|windows nt 6.2)/
            }, {
                s: "Windows 10",
                r: /(windows 10|windows nt 10.0)/
            }, {
                s: "Windows NT 4.0",
                r: /(windows nt 4.0|winnt4.0|winnt|windows nt)/
            }, {
                s: "Windows ME",
                r: /windows me/
            }, {
                s: "Android",
                r: /android/
            }, {
                s: "Open BSD",
                r: /openbsd/
            }, {
                s: "Sun OS",
                r: /sunos/
            }, {
                s: "Linux",
                r: /(linux|x11)/
            }, {
                s: "iOS",
                r: /(iphone|ipad|ipod)/
            }, {
                s: "Mac OS X",
                r: /mac os x/
            }, {
                s: "Mac OS",
                r: /(macppc|macintel|mac_powerpc|macintosh)/
            }, {
                s: "QNX",
                r: /qnx/
            }, {
                s: "UNIX",
                r: /unix/
            }, {
                s: "BeOS",
                r: /beos/
            }, {
                s: "OS/2",
                r: /os\/2/
            }, {
                s: "Search Bot",
                r: /(nuhk|googlebot|yammybot|openbot|slurp|msnbot|ask jeeves\/teoma|ia_archiver)/
            } ], m = void 0, n = void 0;
            for (m in l) if (l.hasOwnProperty(m) && (n = l[m], n.r.test(h))) {
                b = n.s;
                break;
            }
            switch (b && /Windows/.test(b) && (c = /Windows (.*)/.exec(b)[1], b = f.osName.windows), 
            b) {
              case f.osName.mac:
                c = /mac os x (10[\.\_\d]+)/.exec(h)[1];
                break;

              case f.osName.android:
                c = /android ([\.\_\d]+)/.exec(h)[1];
                break;

              case f.osName.ios:
                if (!(c = /os (\d+)_(\d+)_?(\d+)?/.exec(i))) break;
                c = c[1] + "." + c[2] + "." + (0 | c[3]);
            }
            return {
                browserName: a,
                browserVersion: j.toString(),
                os: b,
                osVersion: c,
                codeBase: g,
                userAgent: d
            };
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.detect = d;
        var e = a("../config/constants"), f = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(e);
    }, {
        "../config/constants": 32
    } ],
    18: [ function(a, b, c) {
        "use strict";
        function d(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }
        function e(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.Devices = void 0;
        var f = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), g = a("../config/constants"), h = d(g), i = a("../utility/registry"), j = a("../utility/csiologger"), k = d(j), l = a("../utility/utils"), m = d(l), n = function() {
            function a(b, c) {
                e(this, a), this.conferenceId = b, this.pc = c, this.devices = null, this.emb = i.Registry.getEventMessageBuilder();
            }
            return f(a, [ {
                key: "collectConnected",
                value: function() {
                    var a = this;
                    if (navigator.mediaDevices && navigator.mediaDevices.enumerateDevices) {
                        var b = this;
                        navigator.mediaDevices.enumerateDevices().then(function(c) {
                            var d = m.normalizeMediaDeviceList(c);
                            b.sendConnected(d), setTimeout(a.collectConnected.bind(b), 1e4);
                        }).catch(function(c) {
                            setTimeout(a.collectConnected.bind(b), 1e4);
                        });
                    }
                }
            }, {
                key: "sendConnected",
                value: function(a) {
                    this.devices ? this.compare(a) || (this.devices = a, this.send()) : (this.devices = a, 
                    this.send());
                }
            }, {
                key: "compare",
                value: function(a) {
                    return self.devices.sort().toString() === a.sort().toString();
                }
            }, {
                key: "send",
                value: function() {
                    var a = {
                        mediaDeviceList: this.devices
                    };
                    k.log("sending connectedDevice", h.internalFabricEvent.connectedDeviceList, a), 
                    this.emb.make(h.internalFabricEvent.connectedDeviceList, this.conferenceId, this.pc, a);
                }
            } ]), a;
        }();
        c.Devices = n;
    }, {
        "../config/constants": 32,
        "../utility/csiologger": 87,
        "../utility/registry": 94,
        "../utility/utils": 100
    } ],
    19: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (b) try {
                window && window.localStorage && window.localStorage.setItem(a, b);
            } catch (a) {
                return;
            }
        }
        function e(a) {
            try {
                if (window && window.localStorage) return window.localStorage.getItem(a);
            } catch (a) {
                return null;
            }
            return null;
        }
        function f(a) {
            try {
                window && window.localStorage && window.localStorage.removeItem(a);
            } catch (a) {
                return;
            }
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.store = d, c.get = e, c.remove = f;
    }, {} ],
    20: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (b) try {
                window && window.sessionStorage && window.sessionStorage.setItem(a, b);
            } catch (a) {
                return;
            }
        }
        function e(a) {
            try {
                if (window && window.sessionStorage) return window.sessionStorage.getItem(a);
            } catch (a) {
                return null;
            }
            return null;
        }
        function f(a) {
            try {
                window && window.sessionStorage && window.sessionStorage.removeItem(a);
            } catch (a) {
                return;
            }
        }
        function g(a, b) {
            if (a) {
                var c = JSON.parse(e("csio_ucid_data"));
                c || (c = {}), c[a] || (c[a] = {}), c[a].ucID = b, d("csio_ucid_data", JSON.stringify(c));
            }
        }
        function h(a) {
            if (!a) return null;
            var b = JSON.parse(e("csio_ucid_data"));
            return b && b[a] ? b[a].ucID : null;
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.store = d, c.get = e, c.remove = f, c.storeUcId = g, c.getUcId = h;
    }, {} ],
    21: [ function(a, b, c) {
        (function(c) {
            "use strict";
            function d(a) {
                if (a && a.__esModule) return a;
                var b = {};
                if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
                return b.default = a, b;
            }
            function e(a, b) {
                if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
            }
            function f(a, b) {
                var c = {};
                return c.status = a, b && (c.message = b), c;
            }
            function g(a, b) {
                return a + ": " + b + " " + (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "");
            }
            function h() {
                var a = null, b = r.Registry.getEndpoint().getBrowserName();
                return "Firefox" === b ? a = mozRTCPeerConnection : "Chrome" === b || "Opera" === b ? a = webkitRTCPeerConnection : "Safari" === b ? t.log("Browser type Safari") : "Edge" === b && (a = window.RTCPeerConnection), 
                a;
            }
            function i(a) {
                if (null === a) return !1;
                var b = r.Registry.getEndpoint().getCodeBase();
                if (b === m.codeBaseType.firefox) return "undefined" != typeof mozRTCPeerConnection && a instanceof mozRTCPeerConnection || "undefined" != typeof RTCPeerConnection && a instanceof RTCPeerConnection;
                if (b === m.codeBaseType.edge || "function" == typeof a) return !0;
                var c = h();
                return null !== c && a instanceof c || void 0 !== a.createOffer;
            }
            var j = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(a) {
                return typeof a;
            } : function(a) {
                return a && "function" == typeof Symbol && a.constructor === Symbol && a !== Symbol.prototype ? "symbol" : typeof a;
            }, k = function() {
                function a(a, b) {
                    for (var c = 0; c < b.length; c++) {
                        var d = b[c];
                        d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                        Object.defineProperty(a, d.key, d);
                    }
                }
                return function(b, c, d) {
                    return c && a(b.prototype, c), d && a(b, d), b;
                };
            }(), l = a("./config/constants"), m = d(l), n = a("./config/settings"), o = d(n), p = a("./config/callstatserrors"), q = a("./fsm/mainfsm"), r = a("./utility/registry"), s = a("./utility/csiologger"), t = d(s), u = a("./utility/onerroreventlistner"), v = d(u), w = a("./utility/utils"), x = d(w);
            v.setErrorEventListener(), x.assignPollyfill(), x.isIntegerPollyfill();
            var y = null, z = function() {
                function a() {
                    e(this, a), y = new q.MainFSM();
                }
                return k(a, [ {
                    key: "initialize",
                    value: function(a, b, c, d, e, h) {
                        if (!a || !c || !b) {
                            var i = g("initialize", p.csErrorStrings.argumentError);
                            return t.error(i), f(m.callstatsAPIReturnStatus.failure, i);
                        }
                        if (d && "function" != typeof d) {
                            var j = g("initialize", p.csErrorStrings.argumentError);
                            t.warn(j), d = null;
                        }
                        if (e && "function" != typeof e) {
                            var k = g("initialize", p.csErrorStrings.argumentError);
                            t.warn(k), e = null;
                        }
                        if ("function" != typeof b && !(window.crypto && (window.crypto.subtle || window.crypto.webkitSubtle) || window.msCrypto && window.msCrypto.subtle || window.csioReactNative)) {
                            var l = g("initialize", p.csErrorStrings.cryptoError);
                            return t.error(l), d && d(p.csError.tokenGenerationError, p.csErrorStrings.cryptoError), 
                            f(m.callstatsAPIReturnStatus.failure, l);
                        }
                        try {
                            y.fire(q.MainEvents.onInitialize, a, c, b, d, e, h), y.run();
                        } catch (a) {
                            r.Registry.getGenericEventHandler().sendEvent(m.logEvents.error, {
                                msg: "initialize: Error",
                                error: a.message + ":" + a.stack
                            }), t.error("initialize: Error", a);
                        }
                        return f(m.callstatsAPIReturnStatus.success);
                    }
                }, {
                    key: "addNewFabric",
                    value: function(a, b, c, d, e, h) {
                        var j = null, k = m.endpointType.peer, l = m.transmissionDirection.sendrecv;
                        if (d || (d = m.tmpConferenceId), !a || !c) {
                            var n = g("addNewFabric", p.csErrorStrings.argumentError);
                            return t.error(n), f(m.callstatsAPIReturnStatus.failure, n);
                        }
                        if (h && "function" == typeof h && (j = h), e && "function" == typeof e && (j = e), 
                        e && "function" != typeof e) {
                            if (e.remoteEndpointType) {
                                if (!m.endpointType.hasOwnProperty(e.remoteEndpointType)) {
                                    var o = g("addNewFabric", p.csErrorStrings.invalidEndPointType, e.remoteEndpointType);
                                    return t.error(o), f(m.callstatsAPIReturnStatus.failure, o);
                                }
                                k = e.remoteEndpointType;
                            }
                            if (e.fabricTransmissionDirection) {
                                if (!m.transmissionDirection.hasOwnProperty(e.fabricTransmissionDirection)) {
                                    var s = g("addNewFabric", p.csErrorStrings.invalidTransmissionDirection, e.fabricTransmissionDirection);
                                    return t.error(s), f(m.callstatsAPIReturnStatus.failure, s);
                                }
                                l = e.fabricTransmissionDirection;
                            }
                        }
                        if (!m.fabricUsage.hasOwnProperty(c) || c instanceof Function) {
                            var u = g("addNewFabric", p.csErrorStrings.fabricUsageInvalid, c);
                            return t.error(u), f(m.callstatsAPIReturnStatus.failure, u);
                        }
                        if (!i(a)) {
                            var v = g("addNewFabric", p.csErrorStrings.pcInvalid);
                            return t.error(v), f(m.callstatsAPIReturnStatus.failure, v);
                        }
                        var w = r.Registry.getConferenceManager().get(d);
                        if (w) {
                            if (w.getPeerConnectionManager().getPcHandler(a)) return f(m.callstatsAPIReturnStatus.success);
                        }
                        if (!r.Registry.getCredentials().getAppId() || !r.Registry.getCredentials().getUserId()) {
                            var x = g("addNewFabric", p.csErrorStrings.notInitialized);
                            return t.error(x), f(m.callstatsAPIReturnStatus.failure, x);
                        }
                        try {
                            y.fire(q.MainEvents.onAddNewFabric, a, b, c, d, k, l, j), y.run();
                        } catch (a) {
                            r.Registry.getGenericEventHandler().sendEvent(m.logEvents.error, {
                                msg: "addNewFabric: Error",
                                error: a.message + ":" + a.stack
                            }), t.error("addNewFabric: Error", a);
                        }
                        return f(m.callstatsAPIReturnStatus.success);
                    }
                }, {
                    key: "sendFabricEvent",
                    value: function(a, b, c, d) {
                        if (t.log("sendFabricEvent ", b), c || (c = m.tmpConferenceId), !a || !b) {
                            var e = g("sendFabricEvent", p.csErrorStrings.argumentError);
                            return t.error(e), f(m.callstatsAPIReturnStatus.failure, e);
                        }
                        if (b === m.fabricEvent.fabricSetupFailed) {
                            var h = g("sendFabricEvent", p.csErrorStrings.fabricEventUnsupported, b);
                            return t.error(h), f(m.callstatsAPIReturnStatus.failure, h);
                        }
                        if (!m.fabricEvent.hasOwnProperty(b) && !m.internalFabricEvent.hasOwnProperty(b)) {
                            var i = g("sendFabricEvent", p.csErrorStrings.fabricEventInvalid, b);
                            return t.error(i), f(m.callstatsAPIReturnStatus.failure, i);
                        }
                        if (!(b !== m.fabricEvent.activeDeviceList || d && d.deviceList)) {
                            var j = g("sendFabricEvent ", p.csErrorStrings.argumentError);
                            return t.error(j), f(m.callstatsAPIReturnStatus.failure, j);
                        }
                        var k = r.Registry.getConferenceManager().get(c);
                        if (!r.Registry.getCredentials().getAppId() || !r.Registry.getCredentials().getUserId() || !k) {
                            var l = g("sendFabricEvent ", p.csErrorStrings.notInitialized);
                            return t.error(l), f(m.callstatsAPIReturnStatus.failure, l);
                        }
                        if (!k.getPeerConnectionManager().getPcHandler(a)) {
                            var n = g("sendFabricEvent ", p.csErrorStrings.pcInvalid);
                            return t.error(n), f(m.callstatsAPIReturnStatus.failure, n);
                        }
                        try {
                            y.fire(q.MainEvents.onSendFabricEvent, a, b, c, d), y.run();
                        } catch (a) {
                            r.Registry.getGenericEventHandler().sendEvent(m.logEvents.error, {
                                msg: "sendFabricEvent: Error",
                                error: a.message + ":" + a.stack
                            }), t.error("sendFabricEvent: Error", a);
                        }
                        return f(m.callstatsAPIReturnStatus.success);
                    }
                }, {
                    key: "sendUserFeedback",
                    value: function(a, b, c) {
                        if (!b || !a) {
                            var d = g("sendUserFeedback", p.csErrorStrings.argumentError);
                            return t.error(d), f(m.callstatsAPIReturnStatus.failure, d);
                        }
                        if ("object" !== (void 0 === b ? "undefined" : j(b))) {
                            var e = g("sendUserFeedback", p.csErrorStrings.argumentError);
                            return t.error(e), f(m.callstatsAPIReturnStatus.failure, e);
                        }
                        if (0 === Object.keys(b).length) {
                            var h = g("sendUserFeedback", p.csErrorStrings.argumentError);
                            return t.error(h), f(m.callstatsAPIReturnStatus.failure, h);
                        }
                        try {
                            y.fire(q.MainEvents.onSendUserFeedback, a, b, c), y.run();
                        } catch (a) {
                            r.Registry.getGenericEventHandler().sendEvent(m.logEvents.error, {
                                msg: "sendUserFeedback: Error",
                                error: a.message + ":" + a.stack
                            }), t.error("sendUserFeedback: Error", a);
                        }
                        return f(m.callstatsAPIReturnStatus.success);
                    }
                }, {
                    key: "associateMstWithUserID",
                    value: function(a, b, c, d, e, h) {
                        if (c || (c = m.tmpConferenceId), !a || !d || !e) {
                            var j = g("associateMstWithUserID", p.csErrorStrings.argumentError);
                            return t.error(j), f(m.callstatsAPIReturnStatus.failure, j);
                        }
                        if (!i(a)) {
                            var k = g("associateMstWithUserID", p.csErrorStrings.pcInvalid);
                            return t.error(k), f(m.callstatsAPIReturnStatus.failure, k);
                        }
                        var l = r.Registry.getConferenceManager().get(c);
                        if (!l) {
                            var n = g("associateMstWithUserID", p.csErrorStrings.confereneDoesNotExist);
                            return t.error(n), f(m.callstatsAPIReturnStatus.failure, n);
                        }
                        if (!l.getPeerConnectionManager().getPcHandler(a)) {
                            var o = g("associateMstWithUserID", p.csErrorStrings.pcInvalid);
                            return t.error(o), f(m.callstatsAPIReturnStatus.failure, o);
                        }
                        h && "string" != typeof h && (t.error("associateMstWithUserID: Invalid videoTag"), 
                        h = null);
                        try {
                            y.fire(q.MainEvents.onAssociateMstWithUserID, a, b, c, d, e, h), y.run();
                        } catch (a) {
                            r.Registry.getGenericEventHandler().sendEvent(m.logEvents.error, {
                                msg: "associateMstWithUserID: Error",
                                error: a.message + ":" + a.stack
                            }), t.error("associateMstWithUserID: Error", a);
                        }
                        return f(m.callstatsAPIReturnStatus.success);
                    }
                }, {
                    key: "reportError",
                    value: function(a, b, c, d, e, h) {
                        if (b || (b = m.tmpConferenceId), void 0 === a || !c) {
                            var i = g("reportError", p.csErrorStrings.argumentError);
                            return t.error(i), f(m.callstatsAPIReturnStatus.failure, i);
                        }
                        if (!m.webRTCFunctions.hasOwnProperty(c)) {
                            var j = g("reportError", p.csErrorStrings.webRTCFunctionsInvalid, c);
                            return t.error(j), f(m.callstatsAPIReturnStatus.failure, j);
                        }
                        if (void 0 === d && t.warn("reportError: Missing DOM error parameter"), !r.Registry.getCredentials().getAppId() || !r.Registry.getCredentials().getUserId()) {
                            var k = g("reportError", p.csErrorStrings.notInitialized);
                            return t.error(k), f(m.callstatsAPIReturnStatus.failure, k);
                        }
                        try {
                            y.fire(q.MainEvents.onReportError, a, b, c, d, e, h), y.run();
                        } catch (a) {
                            r.Registry.getGenericEventHandler().sendEvent(m.logEvents.error, {
                                msg: "reportError: Error",
                                error: a.message + ":" + a.stack
                            }), t.error("reportError: Error", a);
                        }
                        return f(m.callstatsAPIReturnStatus.success);
                    }
                }, {
                    key: "setProxyConfig",
                    value: function(a) {
                        if (window && !window.csioproxy) {
                            var b = g("setProxyConfig", p.csErrorStrings.setProxyConfigInvokeError);
                            return t.error(b), f(m.callstatsAPIReturnStatus.failure, b);
                        }
                        if (!a) {
                            var c = g("setProxyConfig", p.csErrorStrings.argumentError);
                            return t.error(c), f(m.callstatsAPIReturnStatus.failure, c);
                        }
                        try {
                            y.fire(q.MainEvents.onSetProxyConfig, a), y.run();
                        } catch (a) {
                            r.Registry.getGenericEventHandler().sendEvent(m.logEvents.error, {
                                msg: "setProxyConfig: Error",
                                error: a.message + ":" + a.stack
                            }), t.error("setProxyConfig: Error", a);
                        }
                        return f(m.callstatsAPIReturnStatus.success);
                    }
                }, {
                    key: "attachWifiStatsHandler",
                    value: function(a) {
                        if (!a) {
                            var b = g("attachWifiStatsHandler", p.csErrorStrings.argumentError);
                            return t.error(b), f(m.callstatsAPIReturnStatus.failure, b);
                        }
                        if ("function" != typeof a) {
                            var c = g("attachWifiStatsHandler", p.csErrorStrings.argumentError);
                            return t.error(c), f(m.callstatsAPIReturnStatus.failure, c);
                        }
                        try {
                            y.fire(q.MainEvents.onAttachWifiStatsHandler, a), y.run();
                        } catch (a) {
                            r.Registry.getGenericEventHandler().sendEvent(m.logEvents.error, {
                                msg: "attachWifiStatsHandler: Error",
                                error: a.message + ":" + a.stack
                            }), t.error("attachWifiStatsHandler: Error", a);
                        }
                        return f(m.callstatsAPIReturnStatus.success);
                    }
                }, {
                    key: "setIdentifiers",
                    value: function(a, b) {
                        if (!a) {
                            var c = g("setIdentifiers", p.csErrorStrings.argumentError);
                            return t.error(c), f(m.callstatsAPIReturnStatus.failure, c);
                        }
                        try {
                            y.fire(q.MainEvents.onSetIdentifiers, a, b), y.run();
                        } catch (a) {
                            r.Registry.getGenericEventHandler().sendEvent(m.logEvents.error, {
                                msg: "setIdentifiers: Error",
                                error: a.message + ":" + a.stack
                            }), t.error("setIdentifiers: Error", a);
                        }
                        return f(m.callstatsAPIReturnStatus.success);
                    }
                }, {
                    key: "makePrecallTest",
                    value: function() {
                        if (!r.Registry.getAuthenticator().getToken() || !r.Registry.getCredentials().getAppId()) {
                            var a = g("makePrecallTest", p.csErrorStrings.notInitialized);
                            return t.error(a), f(m.callstatsAPIReturnStatus.failure, a);
                        }
                        if (!r.Registry.getAuthenticator().getIceServers()) {
                            var b = g("makePrecallTest", p.csErrorStrings.notInitialized);
                            return t.error(b), f(m.callstatsAPIReturnStatus.failure, b);
                        }
                        if (!r.Registry.getCredentials().getCollectSDP()) {
                            var c = g("makePrecallTest", p.csErrorStrings.apiaccesserror);
                            return t.error(c), f(m.callstatsAPIReturnStatus.failure, c);
                        }
                        try {
                            y.fire(q.MainEvents.onMakePrecallTest), y.run();
                        } catch (a) {
                            r.Registry.getGenericEventHandler().sendEvent(m.logEvents.error, {
                                msg: "on: Error",
                                error: a.message + ":" + a.stack
                            }), t.error("makePrecallTest: Error", a);
                        }
                        return f(m.callstatsAPIReturnStatus.success);
                    }
                }, {
                    key: "on",
                    value: function(a, b) {
                        if (!b || "function" != typeof b) {
                            var c = g("on", p.csErrorStrings.argumentError);
                            return t.error(c), f(m.callstatsAPIReturnStatus.failure, c);
                        }
                        if (!a || !m.callbackFunctions.hasOwnProperty(a)) {
                            var d = g("on", p.csErrorStrings.argumentError);
                            return t.error(d), f(m.callstatsAPIReturnStatus.failure, d);
                        }
                        try {
                            y.fire(q.MainEvents.onOn, a, b), y.run();
                        } catch (a) {
                            r.Registry.getGenericEventHandler().sendEvent(m.logEvents.error, {
                                msg: "on: Error",
                                error: a.message + ":" + a.stack
                            }), t.error("on: Error", a);
                        }
                        return f(m.callstatsAPIReturnStatus.success);
                    }
                }, {
                    key: "fabricUsage",
                    get: function() {
                        return this.constructor.fabricUsage;
                    }
                }, {
                    key: "fabricEvent",
                    get: function() {
                        return this.constructor.fabricEvent;
                    }
                }, {
                    key: "webRTCFunctions",
                    get: function() {
                        return this.constructor.webRTCFunctions;
                    }
                }, {
                    key: "csError",
                    get: function() {
                        return this.constructor.csError;
                    }
                }, {
                    key: "qualityRating",
                    get: function() {
                        return this.constructor.qualityRating;
                    }
                }, {
                    key: "callStatsAPIReturnStatus",
                    get: function() {
                        return this.constructor.callStatsAPIReturnStatus;
                    }
                }, {
                    key: "version",
                    get: function() {
                        return this.constructor.version;
                    }
                }, {
                    key: "userIDType",
                    get: function() {
                        return this.constructor.userIDType;
                    }
                }, {
                    key: "transmissionDirection",
                    get: function() {
                        return this.constructor.transmissionDirection;
                    }
                }, {
                    key: "endpointType",
                    get: function() {
                        return this.constructor.endpointType;
                    }
                } ]), a;
            }();
            z.fabricUsage = m.fabricUsage, z.fabricEvent = m.fabricEvent, z.webRTCFunctions = m.webRTCFunctions, 
            z.csError = p.csError, z.qualityRating = m.qualityRating, z.callStatsAPIReturnStatus = m.callstatsAPIReturnStatus, 
            z.version = o.version, z.userIDType = m.userIdType, z.endpointType = m.endpointType, 
            z.transmissionDirection = m.transmissionDirection, function() {
                function a() {
                    return new z();
                }
                "function" == typeof define && define.amd ? define("callstats", [], a) : c.callstats = a, 
                b.exports = a;
            }("undefined" != typeof window && window);
        }).call(this, "undefined" != typeof global ? global : "undefined" != typeof self ? self : "undefined" != typeof window ? window : {});
    }, {
        "./config/callstatserrors": 31,
        "./config/constants": 32,
        "./config/settings": 33,
        "./fsm/mainfsm": 34,
        "./utility/csiologger": 87,
        "./utility/onerroreventlistner": 93,
        "./utility/registry": 94,
        "./utility/utils": 100
    } ],
    22: [ function(a, b, c) {
        "use strict";
        function d(a) {
            if (Array.isArray(a)) {
                for (var b = 0, c = Array(a.length); b < a.length; b++) c[b] = a[b];
                return c;
            }
            return Array.from(a);
        }
        function e(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.BinaryTree = void 0;
        var f = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), g = a("./binarytreenode.js"), h = a("../utility/csiologger"), i = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(h), j = function() {
            function a(b) {
                e(this, a), this.root = null, this.top = null, this.bottom = null, this.comparator = b, 
                this.node_counter = 0, this.duplicate_counter = 0;
            }
            return f(a, [ {
                key: "getTopNode",
                value: function() {
                    return this.top;
                }
            }, {
                key: "getTopValue",
                value: function() {
                    return null === this.top ? null : this.top.peek();
                }
            }, {
                key: "getBottomValue",
                value: function() {
                    return null === this.bottom ? null : this.bottom.peek();
                }
            }, {
                key: "getBottomNode",
                value: function() {
                    return this.bottom;
                }
            }, {
                key: "getDuplicatedCounter",
                value: function() {
                    return this.duplicate_counter;
                }
            }, {
                key: "getNodeCounter",
                value: function() {
                    return this.node_counter;
                }
            }, {
                key: "getSize",
                value: function() {
                    return this.duplicate_counter + this.node_counter;
                }
            }, {
                key: "insertNodeAtTop",
                value: function(a) {
                    a && this.inserting(a.getValues(), this.top);
                }
            }, {
                key: "insertNodeAtBottom",
                value: function(a) {
                    a && this.inserting(a.getValues(), this.bottom);
                }
            }, {
                key: "insert",
                value: function(a) {
                    this.inserting([ a ], this.root);
                }
            }, {
                key: "createNode",
                value: function(a) {
                    var b = new (Function.prototype.bind.apply(g.BinaryTreeNode, [ null ].concat(d(a))))();
                    return null === this.top ? this.top = b : this.comparator(this.top.peek(), b.peek()) < 0 && (this.top = b), 
                    null === this.bottom ? this.bottom = b : this.comparator(b.peek(), this.bottom.peek()) < 0 && (this.bottom = b), 
                    b;
                }
            }, {
                key: "inserting",
                value: function(a, b) {
                    if (null === this.root) return this.root = this.createNode(a), this.node_counter = 1, 
                    void (this.duplicate_counter += a.length - 1);
                    for (var c = null, d = b, e = 0; null !== d; ) {
                        if (0 === (e = this.comparator(a[0], d.peek()))) return d.concat(a), this.duplicate_counter += a.length, 
                        void d.find(a[0]);
                        c = d, d = e < 0 ? d.getLeft() : d.getRight();
                    }
                    ++this.node_counter, this.duplicate_counter += a.length - 1, d = this.createNode(a), 
                    e < 0 ? c.setLeft(d) : c.setRight(d);
                }
            }, {
                key: "getRightist",
                value: function(a) {
                    for (var b = null; null !== a.right; ) b = a, a = a.right;
                    return [ a, b ];
                }
            }, {
                key: "getLeftist",
                value: function(a) {
                    for (var b = null; null !== a.getLeft(); ) b = a, a = a.getLeft();
                    return [ a, b ];
                }
            }, {
                key: "popBottomNode",
                value: function() {
                    if (null === this.bottom) return null;
                    var a = this.search(this.bottom.peek()), b = a[0], c = a[1];
                    return this.replaceNode(b, c, b.getRight()), this.disposeNode(b), --this.node_counter, 
                    this.duplicate_counter -= b.getLength() - 1, b.setRight(null), b;
                }
            }, {
                key: "popTopNode",
                value: function() {
                    if (null === this.top) return null;
                    var a = this.search(this.top.peek()), b = a[0], c = a[1];
                    return null === b ? null : (this.replaceNode(b, c, b.getLeft()), this.disposeNode(b), 
                    --this.node_counter, this.duplicate_counter -= b.getLength() - 1, b.setLeft(null), 
                    b);
                }
            }, {
                key: "search",
                value: function(a) {
                    for (var b = this.root, c = null, d = void 0; null !== b; ) {
                        if (0 === (d = this.comparator(a, b.peek()))) return b.find(a) ? [ b, c ] : [ null, null ];
                        c = b, b = d < 0 ? b.getLeft() : b.getRight();
                    }
                    return [ null, null ];
                }
            }, {
                key: "replaceNode",
                value: function(a, b, c) {
                    null !== b ? b.left === a ? b.left = c : b.right = c : this.root = c;
                }
            }, {
                key: "disposeNode",
                value: function(a) {
                    if (null === this.root) return void (this.bottom = this.top = null);
                    if (0 === this.comparator(this.top.peek(), a.peek())) {
                        var b = this.getRightist(this.root);
                        this.top = b[0];
                    }
                    if (0 === this.comparator(this.bottom.peek(), a.peek())) {
                        var c = this.getLeftist(this.root);
                        this.bottom = c[0];
                    }
                }
            }, {
                key: "delete",
                value: function(a) {
                    var b = this.search(a), c = b[0], d = b[1];
                    if (null === c) return !1;
                    if (1 < c.getLength()) return c.remove(a), --this.duplicate_counter, !0;
                    if (--this.node_counter, null === c.getLeft() && null === c.getRight()) this.replaceNode(c, d, null); else if (null === c.getLeft()) this.replaceNode(c, d, c.getRight()); else if (null === c.getRight()) this.replaceNode(c, d, c.getLeft()); else {
                        for (var e = c.getLeft(), f = c; null !== e.getRight(); f = e, e = e.getRight()) ;
                        var g = e.getLeft();
                        f === c ? f.setLeft(g) : f.setRight(g), c.setValues(e.getValues());
                    }
                    return this.disposeNode(c), !0;
                }
            }, {
                key: "logging",
                value: function() {
                    if (null === this.root) return void i.log("This tree is empty Duplicate Counter: " + this.duplicate_counter);
                    i.log("Size of the tree: " + this.getSize() + " Node: " + this.getNodeCounter() + " Duplicates: " + this.getDuplicatedCounter() + " Top: " + this.getTopNode().toString() + " Bottom: " + this.getBottomNode().toString()), 
                    function a(b, c, d) {
                        if (null !== b) {
                            for (var e = "-", f = 0; f < c; ++f) e += "--";
                            i.log(e + "> (" + d + ") [" + b.toString() + "]"), null !== b.getLeft() && a(b.getLeft(), c + 1, "Left"), 
                            null !== b.getRight() && a(b.getRight(), c + 1, "Right");
                        }
                    }(this.root, 0, "Root");
                }
            } ]), a;
        }();
        c.BinaryTree = j;
    }, {
        "../utility/csiologger": 87,
        "./binarytreenode.js": 23
    } ],
    23: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        });
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = function() {
            function a() {
                d(this, a);
                for (var b = arguments.length, c = Array(b), e = 0; e < b; e++) c[e] = arguments[e];
                this.values = c, this.left = null, this.right = null;
            }
            return e(a, [ {
                key: "getRight",
                value: function() {
                    return this.right;
                }
            }, {
                key: "setRight",
                value: function(a) {
                    this.right = a;
                }
            }, {
                key: "getLeft",
                value: function() {
                    return this.left;
                }
            }, {
                key: "setLeft",
                value: function(a) {
                    this.left = a;
                }
            }, {
                key: "push",
                value: function(a) {
                    this.values.push(a);
                }
            }, {
                key: "concat",
                value: function(a) {
                    this.values = this.values.concat(a);
                }
            }, {
                key: "pop",
                value: function() {
                    return this.values.length < 1 ? null : this.values.shift();
                }
            }, {
                key: "remove",
                value: function(a) {
                    this.values.splice(this.values.indexOf(a), 1);
                }
            }, {
                key: "setValues",
                value: function(a) {
                    this.values = a;
                }
            }, {
                key: "getValues",
                value: function() {
                    return this.values;
                }
            }, {
                key: "hasValue",
                value: function() {
                    return 0 < this.values.length;
                }
            }, {
                key: "getLength",
                value: function() {
                    return this.values.length;
                }
            }, {
                key: "peek",
                value: function() {
                    return this.values.length < 1 ? null : this.values[0];
                }
            }, {
                key: "find",
                value: function(a) {
                    return this.values.find(function(b) {
                        return b === a;
                    });
                }
            }, {
                key: "toString",
                value: function() {
                    return this.values.toString();
                }
            } ]), a;
        }();
        c.BinaryTreeNode = f;
    }, {} ],
    24: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.Cache = void 0;
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("../utility/csiologger"), g = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(f), h = function() {
            function a() {
                d(this, a), this.queue = [], this.priority = [];
            }
            return e(a, [ {
                key: "add",
                value: function(a) {
                    var b = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    if (this.length() > 1e6) return void g.error("Maximum cached items reached, dropping.");
                    b ? this.priority.push(a) : this.queue.push(a);
                }
            }, {
                key: "pop",
                value: function() {
                    return this.priority.length > 0 ? this.priority.shift() : this.queue.shift();
                }
            }, {
                key: "peak",
                value: function() {
                    return this.priority.length > 0 ? this.priority[0] : this.queue.length > 0 ? this.queue[0] : null;
                }
            }, {
                key: "length",
                value: function() {
                    return this.queue.length + this.priority.length;
                }
            }, {
                key: "updateConferenceId",
                value: function(a) {
                    for (var b = 0; b < this.queue.length; ++b) {
                        this.queue[b].updateConferenceId(a);
                    }
                    for (var c = 0; c < this.priority.length; ++c) {
                        this.priority[c].updateConferenceId(a);
                    }
                }
            } ]), a;
        }();
        c.Cache = h;
    }, {
        "../utility/csiologger": 87
    } ],
    25: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.Component = void 0;
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("./port"), g = a("../utility/csiologger"), h = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(g), i = function() {
            function a() {
                var b = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "Unknown";
                d(this, a), this.name = b, this.ports = new Map();
            }
            return e(a, [ {
                key: "bindPort",
                value: function(a, b) {
                    var c = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : this;
                    if (this.ports.has(a)) return void h.warn("Port (" + a + ") for " + this.name + " already exists.");
                    this.ports.set(a, new f.Port(b, c));
                }
            }, {
                key: "declarePort",
                value: function(a) {
                    if (this.ports.has(a)) return void h.warn("Port (" + a + ") for " + this.name + " already exists.");
                    this.ports.set(a, null);
                }
            }, {
                key: "getPort",
                value: function(a) {
                    return this.ports.get(a);
                }
            }, {
                key: "isConnected",
                value: function(a) {
                    return !!this.ports.has(a) && null !== this.ports.get(a);
                }
            }, {
                key: "connect",
                value: function(a, b) {
                    if (!this.ports.has(a)) return void h.warn("Port (" + a + ") for " + this.name + " does not exists.");
                    this.ports.set(a, b);
                }
            }, {
                key: "transmit",
                value: function(a) {
                    var b = this.ports.get(a);
                    if (void 0 === b) return void h.warn("Port (" + a + ") for " + this.name + " does not exists.");
                    if (null === b) return void h.warn("Port (" + a + ") for " + this.name + " is not connected.");
                    for (var c = arguments.length, d = Array(c > 1 ? c - 1 : 0), e = 1; e < c; e++) d[e - 1] = arguments[e];
                    b.transmit(d);
                }
            }, {
                key: "request",
                value: function(a) {
                    var b = this.ports.get(a);
                    if (void 0 === b) return h.warn("Port (" + a + ") for " + this.name + " does not exists."), 
                    null;
                    if (null === b) return h.warn("Port (" + a + ") for " + this.name + " is not connected."), 
                    null;
                    for (var c = arguments.length, d = Array(c > 1 ? c - 1 : 0), e = 1; e < c; e++) d[e - 1] = arguments[e];
                    return b.request(d);
                }
            } ]), a;
        }();
        c.Component = i;
    }, {
        "../utility/csiologger": 87,
        "./port": 26
    } ],
    26: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        });
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = function() {
            function a(b) {
                var c = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null;
                d(this, a), this.target = b, this.object = c;
            }
            return e(a, [ {
                key: "transmit",
                value: function(a) {
                    this.target.apply(this.object, a);
                }
            }, {
                key: "request",
                value: function(a) {
                    return this.target.apply(this.object, a);
                }
            } ]), a;
        }();
        c.Port = f;
    }, {} ],
    27: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.SlidingWindow = void 0;
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("./switem"), g = a("../utility/timestamps"), h = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(g), i = function() {
            function a(b, c) {
                d(this, a), this.items = [], this.plugins = [], this.postProcesses = [], this.preProcesses = [], 
                this.timeoutInMs = c, this.maxItemsNum = b, this.minItemsNum = 0;
            }
            return e(a, [ {
                key: "setMaxItemsNum",
                value: function(a) {
                    this.maxItemsNum = a;
                }
            }, {
                key: "setTimeoutInMs",
                value: function(a) {
                    this.timeoutInMs = a;
                }
            }, {
                key: "setMinItemsNum",
                value: function(a) {
                    this.minItemsNum = a;
                }
            }, {
                key: "refresh",
                value: function() {
                    var a = h.getCurrent();
                    if (!(this.items.length <= this.minItemsNum)) {
                        for (;0 < this.maxItemsNum && this.maxItemsNum <= this.items.length; ) this.remove();
                        this.timeoutInMs && this.timeoutInMs < a - this.items[0].getCreated() && (this.remove(), 
                        this.refresh());
                    }
                }
            }, {
                key: "getLength",
                value: function() {
                    return this.items.length;
                }
            }, {
                key: "add",
                value: function(a) {
                    this.refresh(), this.items.push(new f.SWItem(a));
                    for (var b = 0; b < this.preProcesses.length; b++) {
                        (0, this.preProcesses[b])(a);
                    }
                    for (var c = 0; c < this.plugins.length; c++) {
                        this.plugins[c].add(a);
                    }
                    for (var d = 0; d < this.postProcesses.length; d++) {
                        (0, this.postProcesses[d])(a);
                    }
                }
            }, {
                key: "remove",
                value: function() {
                    for (var a = this.items.shift(), b = 0; b < this.plugins.length; b++) {
                        this.plugins[b].remove(a.value);
                    }
                }
            }, {
                key: "peek",
                value: function() {
                    var a = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 0;
                    return this.items.length <= a ? null : this.items[this.items.length - a - 1].getValue();
                }
            }, {
                key: "attach",
                value: function(a) {
                    this.plugins.push(a);
                }
            }, {
                key: "addPreProcess",
                value: function(a) {
                    this.preProcesses.push(a);
                }
            }, {
                key: "addPostProcess",
                value: function(a) {
                    this.postProcesses.push(a);
                }
            }, {
                key: "detach",
                value: function(a) {
                    this.plugins = this.plugins.filter(function(b) {
                        return b !== a;
                    });
                }
            } ]), a;
        }();
        c.SlidingWindow = i;
    }, {
        "../utility/timestamps": 98,
        "./switem": 28
    } ],
    28: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.SWItem = void 0;
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("../utility/timestamps"), g = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(f), h = function() {
            function a(b) {
                d(this, a), this.value = b, this.created = g.getCurrent();
            }
            return e(a, [ {
                key: "getValue",
                value: function() {
                    return this.value;
                }
            }, {
                key: "getCreated",
                value: function() {
                    return this.created;
                }
            }, {
                key: "toString",
                value: function() {
                    return "";
                }
            } ]), a;
        }();
        c.SWItem = h;
    }, {
        "../utility/timestamps": 98
    } ],
    29: [ function(a, b, c) {
        "use strict";
        function d(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }
        function e(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.Conference = void 0;
        var f = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), g = a("../peerconnection/peerconnectionmanager"), h = a("../config/settings"), i = d(h), j = a("../utility/registry"), k = a("../browserapi/sessionstorage"), l = d(k), m = function() {
            function a(b, c) {
                e(this, a), this.conferenceId = b, this.startTime, this.peerConnectionManager = new g.PeerConnectionManager(), 
                this.credentials = c, this.ucId = null, this.url = null, this.userJoinedSent = !1;
            }
            return f(a, [ {
                key: "getCredentials",
                value: function() {
                    return this.credentials;
                }
            }, {
                key: "getUcId",
                value: function() {
                    return this.ucId;
                }
            }, {
                key: "setUcId",
                value: function(a) {
                    this.ucId = a, this.url = i.conferenceBaseUrl + j.Registry.getCredentials().getAppId() + "/conferences/" + encodeURIComponent(this.conferenceId) + "/" + a + "/general", 
                    l.storeUcId(this.conferenceId, a);
                }
            }, {
                key: "getPeerConnectionManager",
                value: function() {
                    return this.peerConnectionManager;
                }
            }, {
                key: "getUrl",
                value: function() {
                    return this.url;
                }
            }, {
                key: "updateConferenceId",
                value: function(a) {
                    this.conferenceId = a, this.peerConnectionManager.updateConferenceId(a);
                }
            }, {
                key: "close",
                value: function(a) {}
            } ]), a;
        }();
        c.Conference = m;
    }, {
        "../browserapi/sessionstorage": 20,
        "../config/settings": 33,
        "../peerconnection/peerconnectionmanager": 41,
        "../utility/registry": 94
    } ],
    30: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.ConferenceManager = void 0;
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("./conference"), g = a("../config/constants"), h = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(g), i = function() {
            function a() {
                d(this, a), this.conferenceMap = new Map();
            }
            return e(a, [ {
                key: "add",
                value: function(a, b) {
                    if (!this.get(a)) {
                        var c = new f.Conference(a, b);
                        this.conferenceMap.set(a, c);
                    }
                }
            }, {
                key: "get",
                value: function(a) {
                    return this.conferenceMap.get(a);
                }
            }, {
                key: "getConferenceForPc",
                value: function(a) {
                    var b = null;
                    return a ? (this.conferenceMap.forEach(function(c, d) {
                        var e = c.getPeerConnectionManager().getPcHandler(a);
                        e && e.getConferenceId() === d && (b = c);
                    }), b) : b;
                }
            }, {
                key: "getConferenceForPcHash",
                value: function(a) {
                    var b = null;
                    return a ? (this.conferenceMap.forEach(function(c, d) {
                        var e = c.getPeerConnectionManager().getPcHandlerByHash(a);
                        e && e.getConferenceId() === d && (b = c);
                    }), b) : b;
                }
            }, {
                key: "updateConferenceId",
                value: function(a) {
                    var b = h.tmpConferenceId, c = this.get(b);
                    c && (c.updateConferenceId(a), this.conferenceMap.set(a, c), this.conferenceMap.delete(b));
                }
            }, {
                key: "getConferenceIds",
                value: function() {
                    var a = [];
                    return this.conferenceMap.forEach(function(b, c) {
                        a.push(c);
                    }), a;
                }
            } ]), a;
        }();
        c.ConferenceManager = i;
    }, {
        "../config/constants": 32,
        "./conference": 29
    } ],
    31: [ function(a, b, c) {
        "use strict";
        Object.defineProperty(c, "__esModule", {
            value: !0
        });
        c.csError = {
            httpError: "httpError",
            authError: "authError",
            wsChannelFailure: "wsChannelFailure",
            success: "success",
            csProtoError: "csProtoError",
            appConnectivityError: "appConnectivityError",
            tokenGenerationError: "tokenGenerationError",
            ok: "OK",
            authOngoing: "authOngoing",
            invalidWebRTCFunctionName: "Invalid WebRTC function name",
            invalidEndPointType: "Invalid EndPoint Type",
            invalidTransmissionDirection: "Invalid fabric transmission direction"
        }, c.csErrorStrings = {
            argumentError: "Argument missing/invalid",
            cryptoError: "Browser does not support Web Cryptography API. App secret based authentication requires Web Cryptography API",
            fabricEventUnsupported: "Unsupported fabricEvent",
            fabricEventInvalid: "Invalid fabricEvents value",
            fabricUsageInvalid: "Invalid fabricUsage value",
            notInitialized: "SDK is not initialized or no Fabrics added",
            pcInvalid: "Invalid PeerConnection object passed",
            confereneDoesNotExist: "conferenceId does not exist",
            webRTCFunctionsInvalid: "Invalid webRTC functionName value",
            setProxyConfigInvokeError: "cannot be called if window.csioproxy is false",
            invalidWebRTCFunctionName: "Invalid WebRTC function name",
            invalidEndPointType: "Invalid EndPoint Type",
            invalidTransmissionDirection: "Invalid fabric transmission direction",
            apiaccesserror: "API access Error"
        }, c.csErrorReason = {
            csProtoError: "Protocol fields cannot be empty.",
            csNoAuthState: "Authentication state unavailable in server."
        }, c.internalErrors = {
            authOngoing: "authOngoing"
        }, c.authErrorActions = {
            RETRY: 0,
            GET_NEW_TOKEN: 1,
            REPORT_ERROR: 2
        };
    }, {} ],
    32: [ function(a, b, c) {
        "use strict";
        Object.defineProperty(c, "__esModule", {
            value: !0
        });
        c.logEvents = {
            stateMachine: "stateMachine",
            log: "log",
            timing: "timing",
            error: "error",
            getStatsError: "getStatsError",
            restResponseError: "restResponseError"
        }, c.fabricEvent = {
            fabricSetupFailed: "fabricSetupFailed",
            fabricHold: "fabricHold",
            fabricResume: "fabricResume",
            audioMute: "audioMute",
            audioUnmute: "audioUnmute",
            videoPause: "videoPause",
            videoResume: "videoResume",
            fabricUsageEvent: "fabricUsageEvent",
            fabricTerminated: "fabricTerminated",
            screenShareStart: "screenShareStart",
            screenShareStop: "screenShareStop",
            dominantSpeaker: "dominantSpeaker",
            activeDeviceList: "activeDeviceList",
            applicationErrorLog: "applicationErrorLog"
        }, c.internalFabricEvent = {
            fabricSetup: "fabricSetup",
            fabricSetupFailed: "fabricSetupFailed",
            userJoined: "userJoined",
            userLeft: "userLeft",
            userAlive: "userAlive",
            ssrcMap: "ssrcMap",
            mediaPlaybackStart: "mediaPlaybackStart",
            mediaPlaybackSuspended: "mediaPlaybackSuspended",
            mediaPlaybackStalled: "mediaPlaybackStalled",
            oneWayMedia: "oneWayMedia",
            fabricStateChange: "fabricStateChange",
            iceDisruptionStart: "iceDisruptionStart",
            iceDisruptionEnd: "iceDisruptionEnd",
            fabricTransportSwitch: "fabricTransportSwitch",
            iceConnectionDisruptionStart: "iceConnectionDisruptionStart",
            iceConnectionDisruptionEnd: "iceConnectionDisruptionEnd",
            iceAborted: "iceAborted",
            iceTerminated: "iceTerminated",
            iceFailed: "iceFailed",
            iceRestarted: "iceRestarted",
            fabricDropped: "fabricDropped",
            connectedDeviceList: "connectedDeviceList",
            sdpSubmission: "sdpSubmissionEvent",
            sendingThroughputObservations: "sendingThroughputObservations",
            limitationObservations: "limitationObservations",
            userDetails: "userDetails"
        }, c.callstatsChannels = {
            sdpSubmission: "sdpSubmissionEvent",
            processedStats: "processedStats",
            callstatsEvent: "callStatsEvent",
            userFeedback: "userFeedbackEvent",
            preCallTest: "preCallTest",
            senderConfiguration: "senderConfiguration"
        }, c.precalltestEvents = {
            results: "preCallTestResults",
            associate: "preCallTestAssociate"
        }, c.callstatsAPIReturnStatus = {
            success: "success",
            failure: "failure"
        }, c.fabricUsage = {
            audio: "audio",
            video: "video",
            data: "data",
            screen: "screen",
            multiplex: "multiplex",
            unbundled: "unbundled"
        }, c.userIdType = {
            local: "local",
            remote: "remote"
        }, c.qualityRating = {
            excellent: 5,
            good: 4,
            fair: 3,
            poor: 2,
            bad: 1
        }, c.reportType = {
            local: "local",
            remote: "remote",
            inbound: "inbound",
            outbound: "outbound"
        }, c.avQualityRatings = {
            excellent: "excellent",
            fair: "fair",
            bad: "bad",
            unknown: "unknown"
        }, c.fabricState = {
            established: "established",
            initializing: "initializing",
            failed: "failed",
            disrupted: "disrupted",
            hold: "hold",
            checkingDisrupted: "checkingDisrupted",
            terminated: "terminated"
        }, c.webRTCFunctions = {
            createOffer: "createOffer",
            createAnswer: "createAnswer",
            setLocalDescription: "setLocalDescription",
            setRemoteDescription: "setRemoteDescription",
            addIceCandidate: "addIceCandidate",
            getUserMedia: "getUserMedia",
            iceConnectionFailure: "iceConnectionFailure",
            signalingError: "signalingError",
            applicationError: "applicationError",
            applicationLog: "applicationLog"
        }, c.callFailureReasons = {
            mediaConfigError: "MediaConfigError",
            negotiationFailure: "NegotiationFailure",
            sdpError: "SDPGenerationError",
            iceFailure: "IceConnectionFailure",
            transportFailure: "TransportFailure",
            signalingError: "SignalingError",
            applicationError: "ApplicationError",
            applicationLog: "ApplicationLog",
            invalidWebRTCFunctionName: "Invalid WebRTC function name"
        }, c.throughputThreshold = {
            video: {
                green: 1024,
                red: 256
            },
            audio: {
                green: 30,
                red: 8
            }
        }, c.currOverPrevFrameRateThreshold = {
            video: {
                green: .8,
                red: .3
            }
        }, c.rttThreshold = {
            video: {
                green: 400,
                red: 1e3
            }
        }, c.fractionalLossThreshold = {
            video: {
                green: .1,
                red: .5
            },
            audio: {
                green: .15,
                red: .3
            }
        }, c.eModelThreshold = {
            audio: {
                green: 240,
                red: 400
            }
        }, c.codeBaseType = {
            chrome: "Chrome",
            firefox: "Firefox",
            edge: "Edge",
            plugin: "Plugin"
        }, c.browserName = {
            chrome: "Chrome",
            firefox: "Firefox",
            edge: "Edge",
            msie: "Microsoft Internet Explorer",
            safari: "Safari",
            opera: "Opera"
        }, c.osName = {
            windows: "Windows",
            mac: "Mac OS X",
            android: "Android",
            ios: "iOS"
        }, c.mediaType = {
            audio: "audio",
            video: "video"
        }, c.streamType = {
            inbound: "inbound",
            outbound: "outbound"
        }, c.fabricStateChangeType = {
            signalingState: "signalingState",
            iceConnectionState: "iceConnectionState",
            iceGatheringState: "iceGatheringState"
        }, c.transportType = {
            rest: "rest",
            ws: "ws"
        }, c.wsConnectionState = {
            initiated: "initiated",
            connected: "connected",
            closed: "closed"
        }, c.csCallBackMessages = {
            authSuccessful: "SDK authentication successful.",
            authFailed: "SDK authentication failed.",
            authProtocolInvalid: "Fatal authentication error. Invalid auth protocol message.",
            authOngoing: "Authentication on going.",
            wsConnected: "WebSocket establishment successful.",
            wsClosed: "WebSocket server closed.",
            wsFailed: "WebSocket establishment failed."
        }, c.oneWayMediaTypes = {
            audio: "audio",
            video: "video",
            screen: "screen"
        }, c.limitationType = {
            cpu: "cpu",
            network: "network"
        }, c.qualityDisruptionTypes = {
            qpchange: "qpchange"
        }, c.callbackFunctions = {
            stats: "stats",
            defaultConfig: "defaultConfig",
            recommendedConfig: "recommendedConfig",
            preCallTestResults: "preCallTestResults"
        }, c.endpointType = {
            peer: "peer",
            server: "server"
        }, c.transmissionDirection = {
            sendonly: "sendonly",
            receiveonly: "receiveonly",
            sendrecv: "sendrecv",
            inactive: "inactive"
        }, c.tmpConferenceId = "csio-conf-id-tmp";
    }, {} ],
    33: [ function(a, b, c) {
        "use strict";
        function d(a) {
            c.configServiceUrl = m = a;
        }
        function e(a) {
            c.authServiceUrl = n = a;
        }
        function f(a) {
            c.conferenceBaseUrl = o = a;
        }
        function g(a) {
            c.wsUrl = p = a;
        }
        function h(a) {
            c.restEventUrl = q = a;
        }
        function i(a) {
            c.restStatsUrl = r = a;
        }
        function j(a) {
            c.baseUrl = s = a;
        }
        function k(a) {
            c.qmodelThresholdsAPIUrl = t = a;
        }
        function l(a) {
            c.transportType = u = a;
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.setConfigServiceUrl = d, c.setAuthServiceUrl = e, c.setConferenceBaseUrl = f, 
        c.setWsUrl = g, c.setRestEventUrl = h, c.setRestStatsUrl = i, c.setBaseUrl = j, 
        c.setQmodelThresholdsAPIUrl = k, c.setTransportType = l;
        var m = (c.version = "3.50.3", c.configServiceUrl = "https://appsettings.callstats.io/v1/apps/"), n = c.authServiceUrl = "https://auth.callstats.io/", o = (c.authRetryTimeout = 5e3, 
        c.conferenceBaseUrl = "https://dashboard.callstats.io/apps/"), p = c.wsUrl = "wss://collector.callstats.io:443/csiows/collectCallStats", q = c.restEventUrl = "https://events.callstats.io/v1/apps/", r = c.restStatsUrl = "https://stats.callstats.io/v1/apps/", s = c.baseUrl = "https://collector.callstats.io:443/", t = c.qmodelThresholdsAPIUrl = "https://dashboard.callstats.io/api-internal/v1/qmodelthresholds", u = (c.csioDebug = "false", 
        c.transportType = "@@transportType");
    }, {} ],
    34: [ function(a, b, c) {
        "use strict";
        function d(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }
        function e(a) {
            if (Array.isArray(a)) {
                for (var b = 0, c = Array(a.length); b < a.length; b++) c[b] = a[b];
                return c;
            }
            return Array.from(a);
        }
        function f(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        function g(a, b) {
            if (!a) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
            return !b || "object" != typeof b && "function" != typeof b ? a : b;
        }
        function h(a, b) {
            if ("function" != typeof b && null !== b) throw new TypeError("Super expression must either be null or a function, not " + typeof b);
            a.prototype = Object.create(b && b.prototype, {
                constructor: {
                    value: a,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), b && (Object.setPrototypeOf ? Object.setPrototypeOf(a, b) : a.__proto__ = b);
        }
        function i() {
            Array.prototype.find || Object.defineProperty(Array.prototype, "find", {
                value: function(a) {
                    if (null === this) throw new TypeError("Array.prototype.find called on null or undefined");
                    if ("function" != typeof a) throw new TypeError("predicate must be a function");
                    for (var b = Object(this), c = b.length >>> 0, d = arguments[1], e = void 0, f = 0; f < c; f++) if (e = b[f], 
                    a.call(d, e, f, b)) return e;
                }
            });
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.MainFSM = c.MainEvents = void 0;
        var j = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(a) {
            return typeof a;
        } : function(a) {
            return a && "function" == typeof Symbol && a.constructor === Symbol && a !== Symbol.prototype ? "symbol" : typeof a;
        }, k = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), l = a("./statemachine"), m = a("../utility/registry"), n = a("../utility/csiologger"), o = d(n), p = a("../utility/utils"), q = d(p), r = a("../utility/timestamps"), s = d(r), t = a("../config/constants"), u = d(t), v = a("../config/settings"), w = d(v), x = a("./utility"), y = d(x), z = a("../statspipeline/statsadapter"), A = a("../statspipeline/statsparser"), B = a("../statspipeline/statsmonitor"), C = a("../statspipeline/statstransmitter"), D = a("../statspipeline/statsassembler"), E = {
            Created: "Created",
            Initializing: "Initializing",
            Idle: "Idle",
            Run: "Run"
        }, F = c.MainEvents = {
            onStart: "onStart",
            onInitialize: "onInitialize",
            onAddNewFabric: "onAddNewFabric",
            onSendFabricEvent: "onSendFabricEvent",
            onReportError: "onReportError",
            onAssociateMstWithUserID: "onAssociateMstWithUserID",
            onSetProxyConfig: "onSetProxyConfig",
            onAttachWifiStatsHandler: "onAttachWifiStatsHandler",
            onSendUserFeedback: "onSendUserFeedback",
            onOn: "onOn",
            onSetIdentifiers: "onSetIdentifiers",
            onMakePrecallTest: "onMakePrecallTest"
        }, G = {
            onServicesFinished: "onServicesFinished"
        }, H = function(a) {
            function b() {
                f(this, b);
                var a = g(this, (b.__proto__ || Object.getPrototypeOf(b)).call(this, E.Created));
                return o.log("FSM:", a.getState()), a.fire(F.onStart), a.run(), i(), a;
            }
            return h(b, a), k(b, [ {
                key: "proceed",
                value: function(a, b) {
                    switch (this.getState()) {
                      case E.Created:
                        switch (a) {
                          case F.onStart:
                            this.onStart.apply(this, e(b));
                            break;

                          case F.onInitialize:
                            this.setState(E.Initializing), o.log("FSM:", this.getState()), this.onInitialize.apply(this, e(b));
                            break;

                          case F.onOn:
                            this.onOn.apply(this, e(b));
                        }
                        break;

                      case E.Initializing:
                        switch (a) {
                          case G.onServicesFinished:
                            this.onServicesFinished() && (this.setState(E.Idle), o.log("FSM:", this.getState()));
                            break;

                          case F.onAddNewFabric:
                            this.onAddNewFabric.apply(this, e(b));
                            break;

                          case F.onSendFabricEvent:
                            this.onSendFabricEvent.apply(this, e(b));
                            break;

                          case F.onReportError:
                            this.onReportError.apply(this, e(b));
                            break;

                          case F.onAssociateMstWithUserID:
                            this.onAssociateMstWithUserID.apply(this, e(b));
                            break;

                          case F.onSendUserFeedback:
                            this.onSendUserFeedback.apply(this, e(b));
                            break;

                          case F.onAttachWifiStatsHandler:
                            this.onAttachWifiStatsHandler.apply(this, e(b));
                            break;

                          case F.onOn:
                            this.onOn.apply(this, e(b));
                            break;

                          case F.onMakePrecallTest:
                            this.onMakePrecallTest();
                            break;

                          case F.onSetIdentifiers:
                            this.onSetIdentifiers.apply(this, e(b));
                        }
                        break;

                      case E.Idle:
                      case E.Run:
                        switch (a) {
                          case F.onAddNewFabric:
                            this.onAddNewFabric.apply(this, e(b));
                            break;

                          case F.onSendFabricEvent:
                            this.onSendFabricEvent.apply(this, e(b));
                            break;

                          case F.onReportError:
                            this.onReportError.apply(this, e(b));
                            break;

                          case F.onAssociateMstWithUserID:
                            this.onAssociateMstWithUserID.apply(this, e(b));
                            break;

                          case F.onSendUserFeedback:
                            this.onSendUserFeedback.apply(this, e(b));
                            break;

                          case F.onAttachWifiStatsHandler:
                            this.onAttachWifiStatsHandler.apply(this, e(b));
                            break;

                          case F.onOn:
                            this.onOn.apply(this, e(b));
                            break;

                          case F.onMakePrecallTest:
                            this.onMakePrecallTest();
                            break;

                          case F.onSetIdentifiers:
                            this.onSetIdentifiers.apply(this, e(b));
                        }
                    }
                }
            }, {
                key: "onStart",
                value: function() {
                    m.Registry.getEndpoint().setup(), this.authenticator = m.Registry.getAuthenticator(), 
                    this.configservicewrapper = m.Registry.getConfigServiceWrapper(), this.precalltest = m.Registry.getPreCallTest(), 
                    this.precalltestIds = [];
                    var a = m.Registry.getStatsAdapter(), b = m.Registry.getStatsParser(), c = m.Registry.getStatsMonitor(), d = m.Registry.getStatsTransmitter(), e = m.Registry.getStatsAssembler();
                    a.connect(z.StatsAdapterIO.RawStatsOut, b.getPort(A.StatsParserIO.RawStatsIn)), 
                    b.connect(A.StatsParserIO.PcStatsTupleOut, c.getPort(B.StatsMonitorIO.PcStatsTupleIn)), 
                    c.connect(B.StatsMonitorIO.StatsTupleOut, e.getPort(D.StatsAssemblerIO.StatsTupleIn)), 
                    e.connect(D.StatsAssemblerIO.CallstatsOut, d.getPort(C.StatsTransmitterIO.CallstatsIn)), 
                    a.connect(z.StatsAdapterIO.UnprocessedOut, d.getPort(C.StatsTransmitterIO.UnprocessedIn));
                }
            }, {
                key: "setupConnection",
                value: function() {
                    var a = this;
                    this.connectionManager = m.Registry.getConnectionManager(), this.connectionManager.setupCollectorConnection(m.Registry.getCredentials().getTransportType()), 
                    this.connectionManager.setup().then(function() {
                        o.log("Connected to connectionManager"), a.fire(G.onServicesFinished), a.run();
                    }).catch(function(a) {
                        return o.log("Could not connect to connectionManager", a);
                    });
                }
            }, {
                key: "setup",
                value: function() {
                    var a = this;
                    this.clocksync = m.Registry.getClockSync(), this.clocksync.initiate().then(function() {
                        o.log("Clocksync completed"), a.fire(G.onServicesFinished), a.run();
                    }).catch(function(a) {
                        return o.log("Could not finish ClockSync", a);
                    });
                }
            }, {
                key: "onInitialize",
                value: function(a, b, c, d, e, f) {
                    var g = this, h = m.Registry.getCredentials();
                    if (h.setAppId(a), h.setUserId(b), m.Registry.getCallbacks().set(u.callbackFunctions.stats, e), 
                    this.doPrecalltest = !0, m.Registry.getGenericEventHandler().sendEvent(u.logEvents.log, {
                        msg: "callstats initialize in progress"
                    }), f) {
                        if (!0 === f.disableBeforeUnloadHandler && this.setBeforeUnloadHandler(), f.applicationVersion) {
                            m.Registry.getEndpoint().setAppVersion(f.applicationVersion);
                        }
                        f.transportType && w.setTransportType(f.transportType), f.disablePrecalltest && (this.doPrecalltest = !1);
                    }
                    this.setup(), this.authenticator.initiate(c, d).then(function(a) {
                        o.log("Authentication complete"), g.setupConnection();
                        var b = m.Registry.getCredentials().getStatsSubmissionInterval();
                        m.Registry.getStatsMonitor().setIntervals(b, b), g.fire(G.onServicesFinished), g.run();
                        var c = g.authenticator.getIceServers();
                        c && g.doPrecalltest && g.precalltest.start(c, g.precalltestCallback.bind(g)), g.configservicewrapper.initiateInternalConfig().then(function() {
                            o.log("ConfigService internal config:", g.configservicewrapper.getInternalConfig()), 
                            g.fire(G.onServicesFinished), g.run();
                        }, function(a) {
                            return o.log(a);
                        }), g.configservicewrapper.initiateAppConfig().then(function() {
                            var a = m.Registry.getCallbacks().get(u.callbackFunctions.defaultConfig), b = g.configservicewrapper.getAppDefaultConfig();
                            a && b && a(b);
                            var c = m.Registry.getCallbacks().get(u.callbackFunctions.recommendedConfig), d = g.configservicewrapper.getAppRecommendedConfig();
                            c && d && c(d), g.fire(G.onServicesFinished), g.run();
                        }, function(a) {
                            return o.log(a);
                        });
                    }, function(a) {
                        o.log(a);
                    }), this.genericevent = m.Registry.getGenericEventHandler(), this.genericevent.sendEvent(u.logEvents.log, {
                        msg: "callstats initialize in progress"
                    });
                }
            }, {
                key: "precalltestCallback",
                value: function(a, b) {
                    var c = m.Registry.getCallbacks().get(u.callbackFunctions.preCallTestResults);
                    if (c) {
                        if (b) {
                            var d = {
                                msg: "precalltest error: " + b
                            };
                            return o.warn("backendlog", d), this.genericevent.sendEvent(u.logEvents.log, d), 
                            void c(u.callstatsAPIReturnStatus.failure, null);
                        }
                        var e = y.getPublicPrecalltestResults(a);
                        c(u.callstatsAPIReturnStatus.success, e);
                    }
                    a && (this.precalltestIds.push(a.id), a.tests && a.tests.ice && ("" === a.tests.ice.turnIpAddress && delete a.tests.ice.turnIpAddress, 
                    "" === a.tests.ice.turnIpVersion && delete a.tests.ice.turnIpVersion, "" === a.tests.ice.turnTransport && delete a.tests.ice.turnTransport), 
                    o.log("sending preCallTest results", a), m.Registry.getEventMessageBuilder().make(u.precalltestEvents.results, null, null, {
                        results: a
                    }));
                }
            }, {
                key: "setBeforeUnloadHandler",
                value: function() {
                    window && window.addEventListener && (o.log("setBeforeUnloadHandler"), window.addEventListener("beforeunload", function(a) {
                        return m.Registry.getConferenceManager().conferenceMap.forEach(function(a, b) {
                            a && a.getPeerConnectionManager().pcHandlers.forEach(function(a, b) {
                                m.Registry.getEventMessageBuilder().make(u.internalFabricEvent.userLeft, a.getConferenceId(), a.getPeerConnection());
                            });
                        }), "Are you sure you want to close the call?";
                    }));
                }
            }, {
                key: "onServicesFinished",
                value: function() {
                    return !!(this.connectionManager && this.connectionManager.isReady() && this.clocksync.isCompleted() && this.authenticator.isCompleted()) && (m.Registry.getTransmissionManager().trySend(), 
                    !0);
                }
            }, {
                key: "onAddNewFabric",
                value: function(a, b, c, d, e, f, g) {
                    o.warn("FSM onAddNewFabric"), m.Registry.getConferenceManager().add(d, m.Registry.getCredentials());
                    var h = m.Registry.getConferenceManager().get(d);
                    h.getPeerConnectionManager().addPcHandler(a, b, c, d, e, f, g);
                    var i = {
                        endpointInfo: m.Registry.getEndpoint().serialize()
                    };
                    m.Registry.getCredentials().getUserIdObject() && (i.localUserIDObject = m.Registry.getCredentials().getUserIdObject()), 
                    h.userJoinedSent || (m.Registry.getEventMessageBuilder().make(u.internalFabricEvent.userJoined, d, a, i), 
                    h.userJoinedSent = !0, m.Registry.getCredentials().getTransportType() === u.transportType.rest && i.localUserIDObject && i.localUserIDObject.userName && m.Registry.getEventMessageBuilder().make(u.internalFabricEvent.userDetails, d, a, {
                        userName: String(i.localUserIDObject.userName)
                    }));
                    var j = this.precalltestIds;
                    this.precalltestIds = [];
                    var k = this.precalltest.getId();
                    k && j.push(k), j.length > 0 && m.Registry.getEventMessageBuilder().make(u.precalltestEvents.associate, d, a, {
                        ids: j
                    });
                }
            }, {
                key: "onSendFabricEvent",
                value: function(a, b, c, d) {
                    o.warn("FSM onSendFabricEvent");
                    var e = {};
                    if (d && (e = d), b === u.fabricEvent.activeDeviceList) {
                        e = {
                            mediaDeviceList: q.normalizeMediaDeviceList(d.deviceList)
                        };
                    }
                    m.Registry.getEventMessageBuilder().make(b, c, a, e);
                    var f = m.Registry.getConferenceManager().get(c);
                    if (f) {
                        var g = f.getPeerConnectionManager().getPcHandler(a);
                        b !== u.fabricEvent.fabricTerminated && b !== u.internalFabricEvent.fabricSetupFailed || (g.stopUserAliveHandler(), 
                        g.setPcState(u.fabricState.terminated), g.stopStatsPolling()), b === u.fabricEvent.fabricHold && (g.setPcState(u.fabricState.hold), 
                        g.stopStatsPolling()), b === u.fabricEvent.fabricResume && (g.setPcState(u.fabricState.established), 
                        g.startStatsPolling());
                    }
                }
            }, {
                key: "onReportError",
                value: function(a, b, c, d, e, f) {
                    o.warn("FSM onReportError");
                    var g = {
                        failureDelay: 0,
                        reason: this.callFailureClassifier(c),
                        function: c,
                        magicKey: m.Registry.getEndpoint().getMagicKey(),
                        endpoint: m.Registry.getEndpoint().serialize(),
                        level: "debug"
                    };
                    if (d) {
                        var h = this.formatDomError(d);
                        g.message = h.message, g.messageType = h.messageType, g.name = d.name, g.stack = d.stack;
                    }
                    if (a) {
                        var i = m.Registry.getConferenceManager().get(b), j = void 0;
                        if (i && (j = i.getPeerConnectionManager().getPcHandler(a)), !j) return void o.error("onReportError: No handler found for given PeerConnection!");
                        if (g.failureDelay = s.getCurrent() - j.getStartTime(), g.fabricState = j.getPcState(), 
                        g.iceConnectionState = j.getIceConnectionState(), (e || f || a && "closed" !== a.signalingState) && m.Registry.getCredentials().getCollectSDP() && c === u.fabricEvent.fabricSetupFailed) {
                            var k = {};
                            k.localSDP = this.pickSDP(a, e, "localDescription"), k.remoteSDP = this.pickSDP(a, f, "remoteDescription"), 
                            m.Registry.getEventMessageBuilder().make(u.callstatsChannels.sdpSubmission, b, a, k);
                        }
                    }
                    c === u.webRTCFunctions.applicationLog || c === u.webRTCFunctions.applicationError ? m.Registry.getEventMessageBuilder().make(u.fabricEvent.applicationErrorLog, b, a, g) : m.Registry.getEventMessageBuilder().make(u.fabricEvent.fabricSetupFailed, b, a, g);
                }
            }, {
                key: "onAssociateMstWithUserID",
                value: function(a, b, c, d, e, f) {
                    var g = m.Registry.getConferenceManager().get(c);
                    if (g) {
                        var h = g.getPeerConnectionManager().getPcHandler(a);
                        "string" != typeof d && (d += ""), h.updateSSRCInfo(d, b, e, f);
                    }
                }
            }, {
                key: "onAttachWifiStatsHandler",
                value: function(a) {
                    m.Registry.getWifiStatsExecutor().setGetWifiStatsMethod(a);
                }
            }, {
                key: "onSetProxyConfig",
                value: function(a) {
                    a.collectorURL && w.setBaseUrl(a.collectorURL), a.authServiceURL && w.setAuthServiceUrl(a.authServiceURL), 
                    a.csioInternalAPIURL && w.setQmodelThresholdsAPIUrl(a.csioInternalAPIURL), a.wsURL && w.setWsUrl(a.wsURL), 
                    a.restEventUrl && w.setRestEventUrl(a.restEventURL), a.restStatsUrl && w.setRestStatsUrl(a.restStatsURL), 
                    this.setup();
                }
            }, {
                key: "onSendUserFeedback",
                value: function(a, b, c) {
                    var d = {
                        feedback: {
                            overallRating: b.overall
                        }
                    };
                    b.video && (d.feedback.videoQualityRating = b.video), b.audio && (d.feedback.audioQualityRating = b.audio), 
                    b.comment && (d.feedback.comments = b.comment), m.Registry.getEventMessageBuilder().make(u.callstatsChannels.userFeedback, a, null, d);
                }
            }, {
                key: "onOn",
                value: function(a, b) {
                    m.Registry.getCallbacks().set(a, b);
                }
            }, {
                key: "onSetIdentifiers",
                value: function(a, b) {
                    if (a.conferenceID && (m.Registry.getConferenceManager().updateConferenceId(a.conferenceID), 
                    m.Registry.getTransmissionManager().updateConferenceId(a.conferenceID), m.Registry.getTransmissionManager().trySend()), 
                    a.remoteUserID && b) {
                        var c = m.Registry.getConferenceManager().getConferenceForPc(b);
                        if (!c) return void o.log("onSetIdentifiers conference not found");
                        var d = c.getPeerConnectionManager().getPcHandler(b);
                        if (!d) return void o.log("pcHandler not found");
                        d.updateRemoteId(a.remoteUserID), m.Registry.getTransmissionManager().trySend();
                    }
                }
            }, {
                key: "onMakePrecallTest",
                value: function() {
                    var a = this, b = this.authenticator.getIceServers();
                    a.precalltest.start(b, a.precalltestCallback.bind(a));
                }
            }, {
                key: "callFailureClassifier",
                value: function(a) {
                    var b = void 0;
                    return u.webRTCFunctions.hasOwnProperty(a) ? a === u.webRTCFunctions.createOffer || a === u.webRTCFunctions.createAnswer || a === u.webRTCFunctions.setRemoteDescription ? b = u.callFailureReasons.negotiationFailure : a === u.webRTCFunctions.setLocalDescription ? b = u.callFailureReasons.sdpError : a === u.webRTCFunctions.addIceCandidate ? b = u.callFailureReasons.sdpError : a === u.webRTCFunctions.getUserMedia ? b = u.callFailureReasons.mediaConfigError : a === u.webRTCFunctions.iceConnectionFailure ? b = u.callFailureReasons.iceFailure : a === u.webRTCFunctions.signalingError ? b = u.callFailureReasons.signalingError : (a === u.webRTCFunctions.applicationLog || u.webRTCFunctions.applicationError) && (b = u.callFailureReasons.applicationLog) : b = u.callFailureReasons.invalidWebRTCFunctionName, 
                    b;
                }
            }, {
                key: "formatDomError",
                value: function(a) {
                    var b = {}, c = {};
                    a && (window.DOMException && a instanceof window.DOMException ? (c.message = a.message, 
                    c.name = a.name, b.messageType = "domError") : "object" === (void 0 === a ? "undefined" : j(a)) ? (a.message && (c.message = a.message), 
                    a.name && (c.name = a.name), a.constraintName && (c.name = a.constraintName), a.stack && (c.stack = a.stack), 
                    b.messageType = "json") : (c = a, b.messageType = "text"));
                    var d = this.truncateLog(c);
                    return "object" === (void 0 === d ? "undefined" : j(d)) ? b.message = JSON.stringify(d) : b.message = d, 
                    b;
                }
            }, {
                key: "pickSDP",
                value: function(a, b, c) {
                    return b || (a && a[c] ? a[c].sdp : "");
                }
            }, {
                key: "truncateString",
                value: function(a) {
                    return a.length > 2e4 && (o.log("Log exceeds 20kb, It will be truncated"), a = a.substring(0, 2e4)), 
                    a;
                }
            }, {
                key: "truncateLog",
                value: function(a) {
                    return a ? ("string" == typeof a ? a = this.truncateString(a) : "object" === (void 0 === a ? "undefined" : j(a)) && a.message && (a.message = this.truncateString(a.message)), 
                    a) : a;
                }
            } ]), b;
        }(l.StateMachine);
        c.MainFSM = H;
    }, {
        "../config/constants": 32,
        "../config/settings": 33,
        "../statspipeline/statsadapter": 68,
        "../statspipeline/statsassembler": 69,
        "../statspipeline/statsmonitor": 71,
        "../statspipeline/statsparser": 72,
        "../statspipeline/statstransmitter": 73,
        "../utility/csiologger": 87,
        "../utility/registry": 94,
        "../utility/timestamps": 98,
        "../utility/utils": 100,
        "./statemachine": 36,
        "./utility": 37
    } ],
    35: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        });
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = function() {
            function a(b, c) {
                d(this, a), this.type = b, this.args = void 0 !== c ? c : null;
            }
            return e(a, [ {
                key: "getType",
                value: function() {
                    return this.type;
                }
            }, {
                key: "getArgs",
                value: function() {
                    return this.args;
                }
            } ]), a;
        }();
        c.ProgramEvent = f;
    }, {} ],
    36: [ function(a, b, c) {
        "use strict";
        function d(a, b) {
            if (!(a instanceof b)) throw new TypeError("Cannot call a class as a function");
        }
        Object.defineProperty(c, "__esModule", {
            value: !0
        }), c.StateMachine = void 0;
        var e = function() {
            function a(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = b[c];
                    d.enumerable = d.enumerable || !1, d.configurable = !0, "value" in d && (d.writable = !0), 
                    Object.defineProperty(a, d.key, d);
                }
            }
            return function(b, c, d) {
                return c && a(b.prototype, c), d && a(b, d), b;
            };
        }(), f = a("./programevent"), g = a("../utility/csiologger"), h = function(a) {
            if (a && a.__esModule) return a;
            var b = {};
            if (null != a) for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
            return b.default = a, b;
        }(g), i = function() {
            function a(b) {
                d(this, a), this.events = [], this.state = b;
            }
            return e(a, [ {
                key: "fire",
                value: function(a) {
                    for (var b = arguments.length, c = Array(b > 1 ? b - 1 : 0), d = 1; d < b; d++) c[d - 1] = arguments[d];
                    var e = new f.ProgramEvent(a, c);
                    this.events.push(e);
                }
            }, {
                key: "proceed",
                value: function(a, b) {
                    h.warn("You need to overwrite the proceed function inan extended StateMachine");
                }
            }, {
                key: "setState",
                value: function(a) {
                    this.state = a;
                }
            }, {
                key: "getState",
                value: function() {
                    return this.state;
                }
            }, {
                key: "run",
                value: function() {
                    if (!(this.events.length < 1)) {
                        var a = this.events.shift();
                        this.proceed(a.getType(), a.getArgs());
                    }
                }
            } ]), a;
        }();
        c.StateMachine = i;
    }, {
        "../utility/csiologger": 87,
        "./programevent": 35
    } ],
    37: [ function(a, b, c) {
        "use strict";
        function d(a) {
            var b = {
                mediaConnectivity: !1,
                throughput: null,
                fractionalLoss: null,
                rtt: null
            };
            return a && a.tests ? (a.tests.rtt && (b.rtt = a.tests.rtt.median, b.mediaConnectivity = !0), 
            a.tests.throughput && (b.throughput = a.tests.throughput.average, b.fractionalLoss = Math.max(a.tests.throughput.fractionLostBytes, 0), 
            b) : b;
        }
    }, {} ],

