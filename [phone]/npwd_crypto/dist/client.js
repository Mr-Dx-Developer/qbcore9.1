(() => {
  var __defProp = Object.defineProperty;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __getOwnPropSymbols = Object.getOwnPropertySymbols;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __propIsEnum = Object.prototype.propertyIsEnumerable;
  var __defNormalProp = (obj, key, value) => key in obj ? __defProp(obj, key, { enumerable: true, configurable: true, writable: true, value }) : obj[key] = value;
  var __spreadValues = (a, b) => {
    for (var prop in b || (b = {}))
      if (__hasOwnProp.call(b, prop))
        __defNormalProp(a, prop, b[prop]);
    if (__getOwnPropSymbols)
      for (var prop of __getOwnPropSymbols(b)) {
        if (__propIsEnum.call(b, prop))
          __defNormalProp(a, prop, b[prop]);
      }
    return a;
  };
  var __esm = (fn, res) => function __init() {
    return fn && (res = (0, fn[__getOwnPropNames(fn)[0]])(fn = 0)), res;
  };
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };
  var __async = (__this, __arguments, generator) => {
    return new Promise((resolve, reject) => {
      var fulfilled = (value) => {
        try {
          step(generator.next(value));
        } catch (e) {
          reject(e);
        }
      };
      var rejected = (value) => {
        try {
          step(generator.throw(value));
        } catch (e) {
          reject(e);
        }
      };
      var step = (x) => x.done ? resolve(x.value) : Promise.resolve(x.value).then(fulfilled, rejected);
      step((generator = generator.apply(__this, __arguments)).next());
    });
  };

  // node_modules/@project-error/pe-utils/lib/client/functions.js
  var RegisterNuiCB;
  var init_functions = __esm({
    "node_modules/@project-error/pe-utils/lib/client/functions.js"() {
      RegisterNuiCB = (event, callback) => {
        RegisterNuiCallbackType(event);
        on(`__cfx_nui:${event}`, callback);
      };
    }
  });

  // node_modules/@project-error/pe-utils/lib/common/helpers.js
  function PrefixedUUID(iterator) {
    return `${iterator.toString(36)}-${Math.floor(Math.random() * Number.MAX_SAFE_INTEGER).toString(36)}`;
  }
  var init_helpers = __esm({
    "node_modules/@project-error/pe-utils/lib/common/helpers.js"() {
    }
  });

  // node_modules/@project-error/pe-utils/lib/client/cl_utils.js
  var ClientUtils;
  var init_cl_utils = __esm({
    "node_modules/@project-error/pe-utils/lib/client/cl_utils.js"() {
      init_helpers();
      ClientUtils = class {
        constructor(settings) {
          this.uidCounter = 0;
          this._settings = {
            promiseTimeout: 15e3,
            debugMode: false
          };
          this.setSettings(settings);
        }
        debugLog(...args) {
          if (!this._settings.debugMode)
            return;
          console.log(`^1[ClUtils]^0`, ...args);
        }
        setSettings(settings) {
          this._settings = Object.assign(Object.assign({}, this._settings), settings);
        }
        emitNetPromise(eventName, data) {
          return new Promise((resolve, reject) => {
            let hasTimedOut = false;
            setTimeout(() => {
              hasTimedOut = true;
              reject(`${eventName} has timed out after ${this._settings.promiseTimeout} ms`);
            }, this._settings.promiseTimeout);
            const uniqId = PrefixedUUID(this.uidCounter++);
            const listenEventName = `${eventName}:${uniqId}`;
            emitNet(eventName, listenEventName, data);
            const handleListenEvent = (data2) => {
              removeEventListener(listenEventName, handleListenEvent);
              if (hasTimedOut)
                return;
              resolve(data2);
            };
            onNet(listenEventName, handleListenEvent);
          });
        }
        registerNuiProxy(event) {
          RegisterNuiCallbackType(event);
          on(`__cfx_nui:${event}`, async (data, cb) => {
            this.debugLog(`NUICallback processed: ${event}`);
            this.debugLog(`NUI CB Data:`, data);
            try {
              const res = await this.emitNetPromise(event, data);
              cb(res);
            } catch (e) {
              console.error("Error encountered while listening to resp. Error:", e);
              cb({ err: e });
            }
          });
        }
        registerRPCListener(eventName, cb) {
          onNet(eventName, (listenEventName, data) => {
            this.debugLog(`RPC called: ${eventName}`);
            Promise.resolve(cb(data)).then((retData) => {
              this.debugLog(`RPC Data:`, data);
              emitNet(listenEventName, retData);
            }).catch((e) => {
              console.error(`RPC Error in ${eventName}, ERR: ${e.message}`);
            });
          });
        }
      };
    }
  });

  // node_modules/@project-error/pe-utils/lib/client/types.js
  var init_types = __esm({
    "node_modules/@project-error/pe-utils/lib/client/types.js"() {
    }
  });

  // node_modules/@project-error/pe-utils/lib/client/index.js
  var init_client = __esm({
    "node_modules/@project-error/pe-utils/lib/client/index.js"() {
      init_functions();
      init_cl_utils();
      init_types();
    }
  });

  // node_modules/@project-error/pe-utils/lib/server/sv_utils.js
  var init_sv_utils = __esm({
    "node_modules/@project-error/pe-utils/lib/server/sv_utils.js"() {
      init_helpers();
    }
  });

  // node_modules/@project-error/pe-utils/lib/server/types.js
  var init_types2 = __esm({
    "node_modules/@project-error/pe-utils/lib/server/types.js"() {
    }
  });

  // node_modules/@project-error/pe-utils/lib/server/index.js
  var init_server = __esm({
    "node_modules/@project-error/pe-utils/lib/server/index.js"() {
      init_sv_utils();
      init_types2();
    }
  });

  // node_modules/@project-error/pe-utils/lib/index.js
  var init_lib = __esm({
    "node_modules/@project-error/pe-utils/lib/index.js"() {
      init_client();
      init_server();
      init_helpers();
    }
  });

  // client/client.ts
  var require_client = __commonJS({
    "client/client.ts"(exports) {
      init_lib();
      var Utils = new ClientUtils();
      RegisterNuiCB("npwd_crypto:fetchData", (data, cb) => __async(exports, null, function* () {
        const resp = yield Utils.emitNetPromise("npwd_crypto:fetchCryptoData", {});
        if (resp.status === "ok") {
          cb(__spreadValues({}, resp.data));
        }
      }));
      RegisterNuiCB("npwd_crypto:fetchTransactions", (data, cb) => __async(exports, null, function* () {
        const resp = yield Utils.emitNetPromise("npwd_crypto:fetchTransactionData", {});
        if (resp.status === "ok") {
          cb(resp.data);
        }
      }));
      RegisterNuiCB("npwd_crypto:tryBuyCrypto", (data, cb) => __async(exports, null, function* () {
        const resp = yield Utils.emitNetPromise("npwd_crypto:buyCrypto", data);
        cb(resp);
      }));
      RegisterNuiCB("npwd_crypto:trySellCrypto", (data, cb) => __async(exports, null, function* () {
        const resp = yield Utils.emitNetPromise("npwd_crypto:sellCrypto", data);
        cb(resp);
      }));
      RegisterNuiCB("npwd_crypto:tryTradeCrypto", (data, cb) => __async(exports, null, function* () {
        const resp = yield Utils.emitNetPromise("npwd_crypto:tradeCrypto", data);
        cb(resp);
      }));
    }
  });
  require_client();
})();
