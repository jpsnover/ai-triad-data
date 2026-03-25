"use strict";function _typeof(a){"@babel/helpers - typeof";return _typeof="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(a){return typeof a}:function(a){return a&&"function"==typeof Symbol&&a.constructor===Symbol&&a!==Symbol.prototype?"symbol":typeof a},_typeof(a)}// This script was pulled directly from the IAB GPP stub library.
// https://github.com/IABTechLab/iabgpp-es/blob/1fce81e10b3dc7ae43d3882bd9964055f14b8724/modules/stub/src/stub.js
window.__gpp_addFrame=function(a){if(!window.frames[a])if(document.body){var b=document.createElement("iframe");b.style.cssText="display:none",b.name=a,document.body.appendChild(b)}else window.setTimeout(window.__gpp_addFrame,10,a)},window.__gpp_stub=function(){var a=arguments;if(__gpp.queue=__gpp.queue||[],__gpp.events=__gpp.events||[],!a.length||1==a.length&&"queue"==a[0])return __gpp.queue;if(1==a.length&&"events"==a[0])return __gpp.events;var b=a[0],c=1<a.length?a[1]:null,d=2<a.length?a[2]:null;if("ping"===b)c({gppVersion:"1.1",// must be “Version.Subversion”, current: “1.1”
cmpStatus:"stub",// possible values: stub, loading, loaded, error
cmpDisplayStatus:"hidden",// possible values: hidden, visible, disabled
signalStatus:"not ready",// possible values: not ready, ready
supportedAPIs:["2:tcfeuv2","5:tcfcav1","6:uspv1","7:usnat","8:usca","9:usva","10:usco","11:usut","12:usct"],// list of supported APIs
cmpId:0,// IAB assigned CMP ID, may be 0 during stub/loading
sectionList:[],applicableSections:[],gppString:"",parsedSections:{}},!0);else if("addEventListener"===b){"lastId"in __gpp||(__gpp.lastId=0),__gpp.lastId++;var e=__gpp.lastId;__gpp.events.push({id:e,callback:c,parameter:d}),c({eventName:"listenerRegistered",listenerId:e,// Registered ID of the listener
data:!0,// positive signal
pingData:{gppVersion:"1.1",// must be “Version.Subversion”, current: “1.1”
cmpStatus:"stub",// possible values: stub, loading, loaded, error
cmpDisplayStatus:"hidden",// possible values: hidden, visible, disabled
signalStatus:"not ready",// possible values: not ready, ready
supportedAPIs:["2:tcfeuv2","5:tcfcav1","6:uspv1","7:usnat","8:usca","9:usva","10:usco","11:usut","12:usct"],// list of supported APIs
cmpId:0,// IAB assigned CMP ID, may be 0 during stub/loading
sectionList:[],applicableSections:[],gppString:"",parsedSections:{}}},!0)}else if("removeEventListener"===b){for(var f=!1,g=0;g<__gpp.events.length;g++)if(__gpp.events[g].id==d){__gpp.events.splice(g,1),f=!0;break}c({eventName:"listenerRemoved",listenerId:d,// Registered ID of the listener
data:f,// status info
pingData:{gppVersion:"1.1",// must be “Version.Subversion”, current: “1.1”
cmpStatus:"stub",// possible values: stub, loading, loaded, error
cmpDisplayStatus:"hidden",// possible values: hidden, visible, disabled
signalStatus:"not ready",// possible values: not ready, ready
supportedAPIs:["2:tcfeuv2","5:tcfcav1","6:uspv1","7:usnat","8:usca","9:usva","10:usco","11:usut","12:usct"],// list of supported APIs
cmpId:0,// IAB assigned CMP ID, may be 0 during stub/loading
sectionList:[],applicableSections:[],gppString:"",parsedSections:{}}},!0)}else"hasSection"===b?c(!1,!0):"getSection"===b||"getField"===b?c(null,!0):__gpp.queue.push([].slice.apply(a))},window.__gpp_msghandler=function(a){var b="string"==typeof a.data;try{var c=b?JSON.parse(a.data):a.data}catch(a){var c=null}if("object"===_typeof(c)&&null!==c&&"__gppCall"in c){var d=c.__gppCall;window.__gpp(d.command,function(c,e){var f={__gppReturn:{returnValue:c,success:e,callId:d.callId}};a.source.postMessage(b?JSON.stringify(f):f,"*")},"parameter"in d?d.parameter:null,"version"in d?d.version:"1.1")}},"__gpp"in window&&"function"==typeof window.__gpp||(window.__gpp=window.__gpp_stub,window.addEventListener("message",window.__gpp_msghandler,!1),window.__gpp_addFrame("__gppLocator"));
