webpackJsonp([1],{226:function(t,e){},227:function(t,e){},228:function(t,e,a){a(321);var s=a(5)(a(234),a(477),null,null);t.exports=s.exports},231:function(t,e,a){"use strict";var s=a(461),n=(a.n(s),s.mixins.reactiveProp);e.a=s.Bar.extend({mixins:[n],props:["options"],mounted:function(){this.renderChart(this.chartData,this.options)}})},232:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var s=a(3),n=a(228),r=a.n(n),i=a(34),o=a(33),l=a(230),c=a(229),d=a.n(c),u=a(227),m=(a.n(u),a(226));a.n(m);s.default.use(l.a),s.default.use(d.a),s.default.material.registerTheme("default",{primary:"light-blue",accent:"green",warn:"orange"}),s.default.material.registerTheme({wh:{primary:"white",accent:"light-blue"},about:{primary:"indigo"},contact:{primary:"teal"}}),s.default.config.productionTip=!1,i.a.beforeEach(function(t,e,a){t.meta.requiresAuth?(o.a.checkAuth(),o.a.user.authenticated?a():a({name:"Login"})):a()}),new s.default({el:"#app",router:i.a,template:"<App/>",components:{App:r.a}})},233:function(t,e,a){"use strict";var s=a(473),n=a.n(s);e.a=n.a},234:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var s=a(33);e.default={name:"app",data:function(){return{user:s.a.user}},methods:{logout:function(){s.a.logout()}}}},235:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default={name:"Dash",data:function(){return{msg:"Покрасочная камера №1",showTable:!1}}}},236:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var s=a(231);e.default={name:"effects",data:function(){return{msg:"Эффективность",showTable:!1,someData:[100,65,54,51,25,31,13,1,3],dtc:{labels:["План","Время включения","Время работы","Свет","Завеса","Вентиляция","Нет Завеса – насос","Нет Завеса - уровень воды","Фильтры забиты"],datasets:[{label:"Эффективность, %",data:[100,65,54,51,25,31,13,1,3],borderWidth:1,backgroundColor:["rgba(255, 99, 132, 0.2)","rgba(54, 162, 235, 0.2)","rgba(255, 206, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(153, 102, 255, 0.2)","rgba(255, 159, 64, 0.2)","rgba(75, 192, 12, 0.2)","rgba(153, 12, 35, 0.2)","rgba(255, 59, 64, 0.2)"],borderColor:["rgba(255,99,132,1)","rgba(54, 162, 235, 1)","rgba(255, 206, 86, 1)","rgba(75, 192, 192, 1)","rgba(153, 102, 255, 1)","rgba(255, 159, 64, 1)","rgba(75, 192, 12, 1)","rgba(153, 12, 35, 1)","rgba(255, 59, 64, 1)"]}]},chartOptions:{responsive:!0,maintainAspectRatio:!1,title:{display:!0,text:"Custom Chart Title"},scales:{yAxes:[{ticks:{beginAtZero:!0},gridLines:{display:!0}}],xAxes:[{categorySpacing:1,categoryPercentage:4,gridLines:{display:!0}}]},events:!0,tooltips:{enabled:!0},hover:{animationDuration:0},animation:{duration:1,onComplete:function(){var t=this.chart,e=t.ctx;e.textAlign="center",e.textBaseline="bottom",this.data.datasets.forEach(function(a,s){t.controller.getDatasetMeta(s).data.forEach(function(t,a){var s=[1,2,3,4,5,6,7,8,9],n=s[a];e.fillText(n,t._model.x,t._model.y-5)})})}}}}},mounted:function(){this.generateData()},methods:{generateData:function(){this.dtc={labels:["План","Время включения","Время работы","Свет","Завеса","Вентиляция","Нет Завеса – насос","Нет Завеса - уровень воды","Фильтры забиты"],datasets:[{label:"Эффективность, %",data:[100,this.getRandomInt(),this.getRandomInt(),this.getRandomInt(),this.getRandomInt(),this.getRandomInt(),this.getRandomInt(),this.getRandomInt(),this.getRandomInt()],borderWidth:1,backgroundColor:["rgba(255, 99, 132, 0.2)","rgba(54, 162, 235, 0.2)","rgba(255, 206, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(153, 102, 255, 0.2)","rgba(255, 159, 64, 0.2)","rgba(75, 192, 12, 0.2)","rgba(153, 12, 35, 0.2)","rgba(255, 59, 64, 0.2)"],borderColor:["rgba(255,99,132,1)","rgba(54, 162, 235, 1)","rgba(255, 206, 86, 1)","rgba(75, 192, 192, 1)","rgba(153, 102, 255, 1)","rgba(255, 159, 64, 1)","rgba(75, 192, 12, 1)","rgba(153, 12, 35, 1)","rgba(255, 59, 64, 1)"]}]}},getRandomInt:function(){return Math.floor(96*Math.random())+5}},components:{CommitChart:s.a}}},237:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default={name:"home",data:function(){return{msg:"Добро пожаловать в BBiot"}}}},238:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var s=a(33),n=a(34);e.default={data:function(){return{credentials:{username:"",password:""},error:""}},mounted:function(){this.isAuthenticated()},methods:{submit:function(){var t={username:this.credentials.username,password:this.credentials.password};s.a.login(this,t,"/dashboard/effects")},isAuthenticated:function(){s.a.checkAuth(),s.a.user.authenticated&&n.a.push({path:"/dashboard/effects"})}}}},239:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default={name:"properties",data:function(){return{msg:"Параметры"}}}},240:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var s=a(233);e.default={name:"services",data:function(){return{msg:"Сервис",radialOptions:{minValue:"0",maxValue:"40",width:200,height:200,valueBox:!0,majorTicks:["0","20","40"],colorPlate:"#fff",borderShadowWidth:0,borders:!1,highlights:[{from:30,to:40,color:"rgba(200, 50, 50, .75)"}],animationDuration:1500,animationRule:"linear",title:"Насос водной завесы"},radialValue:35,radialValue2:25,radialValue3:15}},methods:{radOptions:function(t){var e={minValue:"0",maxValue:"40",width:200,height:200,valueBox:!0,majorTicks:["0","20","40"],colorPlate:"#fff",borderShadowWidth:0,borders:!1,highlights:[{from:30,to:40,color:"rgba(200, 50, 50, .75)"}],animationDuration:1500,animationRule:"linear",title:"Насос водной завесы"};return e.title=t,e}},components:{RadialGauge:s.a}}},241:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default={name:"settings",data:function(){return{msg:"Настройки"}}}},242:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var s=a(243),n=a.n(s),r=a(244);a.n(r);e.default={props:{value:Number,options:{type:Object,default:function(){return{}}}},data:function(){return{chart:null}},mounted:function(){this.chart=new r.RadialGauge(n()(this.options,{renderTo:this.$el,value:this.value})).draw()},beforeDestroy:function(){this.chart.destroy()},watch:{value:function(t){this.chart.value=t}}}},319:function(t,e){},320:function(t,e){},321:function(t,e){},322:function(t,e){},323:function(t,e){},324:function(t,e){},33:function(t,e,a){"use strict";var s=a(34);e.a={user:{authenticated:!1},login:function(t,e,a){var n=this;t.$http.post("http://divay.ru:8080/auth/",e).then(function(e){"OK"===e.data.message?(localStorage.setItem("access_id",e.data.access_id),n.user.authenticated=!0,a&&s.a.push({path:a})):t.error="Error:"+e.data.message},function(e){t.error="Error when auth attempt check the net"})},logout:function(){localStorage.removeItem("access_id"),this.user.authenticated=!1,s.a.push({name:"Home"})},checkAuth:function(){var t=localStorage.getItem("access_id");this.user.authenticated=!!t},getAuthHeader:function(){return{Authorization:"Bearer "+localStorage.getItem("access_id")}}}},34:function(t,e,a){"use strict";var s=a(3),n=a(483),r=a(466),i=a.n(r),o=a(469),l=a.n(o),c=a(468),d=a.n(c),u=a(472),m=a.n(u),v=a(467),h=a.n(v),p=a(471),b=a.n(p),_=a(470),f=a.n(_);s.default.use(n.a),e.a=new n.a({routes:[{path:"/",name:"Home",component:d.a},{path:"/dashboard",name:"Dashboard",component:i.a,children:[{path:"effects",component:h.a,meta:{requiresAuth:!0}},{path:"services",component:b.a,meta:{requiresAuth:!0}},{path:"settings",component:m.a,meta:{requiresAuth:!0}}],meta:{requiresAuth:!0}},{path:"/properties",name:"Properties",component:f.a,meta:{requiresAuth:!0}},{path:"/login",name:"Login",component:l.a},{path:"*",redirect:"/"}]})},452:function(t,e,a){function s(t){return a(n(t))}function n(t){var e=r[t];if(!(e+1))throw new Error("Cannot find module '"+t+"'.");return e}var r={"./af":111,"./af.js":111,"./ar":118,"./ar-dz":112,"./ar-dz.js":112,"./ar-kw":113,"./ar-kw.js":113,"./ar-ly":114,"./ar-ly.js":114,"./ar-ma":115,"./ar-ma.js":115,"./ar-sa":116,"./ar-sa.js":116,"./ar-tn":117,"./ar-tn.js":117,"./ar.js":118,"./az":119,"./az.js":119,"./be":120,"./be.js":120,"./bg":121,"./bg.js":121,"./bn":122,"./bn.js":122,"./bo":123,"./bo.js":123,"./br":124,"./br.js":124,"./bs":125,"./bs.js":125,"./ca":126,"./ca.js":126,"./cs":127,"./cs.js":127,"./cv":128,"./cv.js":128,"./cy":129,"./cy.js":129,"./da":130,"./da.js":130,"./de":133,"./de-at":131,"./de-at.js":131,"./de-ch":132,"./de-ch.js":132,"./de.js":133,"./dv":134,"./dv.js":134,"./el":135,"./el.js":135,"./en-au":136,"./en-au.js":136,"./en-ca":137,"./en-ca.js":137,"./en-gb":138,"./en-gb.js":138,"./en-ie":139,"./en-ie.js":139,"./en-nz":140,"./en-nz.js":140,"./eo":141,"./eo.js":141,"./es":143,"./es-do":142,"./es-do.js":142,"./es.js":143,"./et":144,"./et.js":144,"./eu":145,"./eu.js":145,"./fa":146,"./fa.js":146,"./fi":147,"./fi.js":147,"./fo":148,"./fo.js":148,"./fr":151,"./fr-ca":149,"./fr-ca.js":149,"./fr-ch":150,"./fr-ch.js":150,"./fr.js":151,"./fy":152,"./fy.js":152,"./gd":153,"./gd.js":153,"./gl":154,"./gl.js":154,"./gom-latn":155,"./gom-latn.js":155,"./he":156,"./he.js":156,"./hi":157,"./hi.js":157,"./hr":158,"./hr.js":158,"./hu":159,"./hu.js":159,"./hy-am":160,"./hy-am.js":160,"./id":161,"./id.js":161,"./is":162,"./is.js":162,"./it":163,"./it.js":163,"./ja":164,"./ja.js":164,"./jv":165,"./jv.js":165,"./ka":166,"./ka.js":166,"./kk":167,"./kk.js":167,"./km":168,"./km.js":168,"./kn":169,"./kn.js":169,"./ko":170,"./ko.js":170,"./ky":171,"./ky.js":171,"./lb":172,"./lb.js":172,"./lo":173,"./lo.js":173,"./lt":174,"./lt.js":174,"./lv":175,"./lv.js":175,"./me":176,"./me.js":176,"./mi":177,"./mi.js":177,"./mk":178,"./mk.js":178,"./ml":179,"./ml.js":179,"./mr":180,"./mr.js":180,"./ms":182,"./ms-my":181,"./ms-my.js":181,"./ms.js":182,"./my":183,"./my.js":183,"./nb":184,"./nb.js":184,"./ne":185,"./ne.js":185,"./nl":187,"./nl-be":186,"./nl-be.js":186,"./nl.js":187,"./nn":188,"./nn.js":188,"./pa-in":189,"./pa-in.js":189,"./pl":190,"./pl.js":190,"./pt":192,"./pt-br":191,"./pt-br.js":191,"./pt.js":192,"./ro":193,"./ro.js":193,"./ru":194,"./ru.js":194,"./sd":195,"./sd.js":195,"./se":196,"./se.js":196,"./si":197,"./si.js":197,"./sk":198,"./sk.js":198,"./sl":199,"./sl.js":199,"./sq":200,"./sq.js":200,"./sr":202,"./sr-cyrl":201,"./sr-cyrl.js":201,"./sr.js":202,"./ss":203,"./ss.js":203,"./sv":204,"./sv.js":204,"./sw":205,"./sw.js":205,"./ta":206,"./ta.js":206,"./te":207,"./te.js":207,"./tet":208,"./tet.js":208,"./th":209,"./th.js":209,"./tl-ph":210,"./tl-ph.js":210,"./tlh":211,"./tlh.js":211,"./tr":212,"./tr.js":212,"./tzl":213,"./tzl.js":213,"./tzm":215,"./tzm-latn":214,"./tzm-latn.js":214,"./tzm.js":215,"./uk":216,"./uk.js":216,"./ur":217,"./ur.js":217,"./uz":219,"./uz-latn":218,"./uz-latn.js":218,"./uz.js":219,"./vi":220,"./vi.js":220,"./x-pseudo":221,"./x-pseudo.js":221,"./yo":222,"./yo.js":222,"./zh-cn":223,"./zh-cn.js":223,"./zh-hk":224,"./zh-hk.js":224,"./zh-tw":225,"./zh-tw.js":225};s.keys=function(){return Object.keys(r)},s.resolve=n,t.exports=s,s.id=452},465:function(t,e){t.exports={_args:[[{raw:"vue-chartjs",scope:null,escapedName:"vue-chartjs",name:"vue-chartjs",rawSpec:"",spec:"latest",type:"tag"},"E:\\iiot\\vue2\\sBoxVue"]],_from:"vue-chartjs@latest",_id:"vue-chartjs@2.6.2",_inCache:!0,_location:"/vue-chartjs",_nodeVersion:"7.9.0",_npmOperationalInternal:{host:"packages-18-east.internal.npmjs.com",tmp:"tmp/vue-chartjs-2.6.2.tgz_1493472545564_0.4451814501080662"},_npmUser:{name:"apertureless",email:"juszczak.j@googlemail.com"},_npmVersion:"4.5.0",_phantomChildren:{},_requested:{raw:"vue-chartjs",scope:null,escapedName:"vue-chartjs",name:"vue-chartjs",rawSpec:"",spec:"latest",type:"tag"},_requiredBy:["#DEV:/","#USER"],_resolved:"https://registry.npmjs.org/vue-chartjs/-/vue-chartjs-2.6.2.tgz",_shasum:"f0fe61892494325db8e2462cb0397b948b4434f4",_shrinkwrap:null,_spec:"vue-chartjs",_where:"E:\\iiot\\vue2\\sBoxVue",author:{name:"Jakub Juszczak",email:"jakub@posteo.de"},babel:{presets:["es2015"]},browserify:{transform:["babelify"]},bugs:{url:"https://github.com/apertureless/vue-chartjs/issues"},contributors:[{name:"Thorsten Lünborg",url:"https://github.com/LinusBorg"},{name:"Juan Carlos Alonso",url:"https://github.com/jcalonso"}],dependencies:{lodash:"^4.17.4"},description:"vue.js wrapper for chart.js",devDependencies:{"babel-cli":"^6.24.1","babel-core":"^6.24.1","babel-loader":"^7.0.0","babel-plugin-transform-runtime":"^6.23.0","babel-preset-es2015":"^6.24.1","babel-preset-stage-2":"^6.24.1","babel-runtime":"^6.23.0",chai:"^3.5.0","chart.js":"^2.5.0",chromedriver:"^2.28.0","connect-history-api-fallback":"^1.1.0","cross-env":"^3.2.4","cross-spawn":"^5.1.0","css-loader":"^0.28.0",eslint:"^3.19.0","eslint-config-standard":"^10.2.1","eslint-friendly-formatter":"^2.0.7","eslint-loader":"^1.7.1","eslint-plugin-html":"^2.0.1","eslint-plugin-import":"^2.2.0","eslint-plugin-node":"^4.2.2","eslint-plugin-promise":"^3.5.0","eslint-plugin-standard":"^3.0.1","eventsource-polyfill":"^0.9.6",express:"^4.15.2","extract-text-webpack-plugin":"^1.0.1","file-loader":"^0.10.1","function-bind":"^1.0.2","html-webpack-plugin":"^2.28.0","http-proxy-middleware":"^0.17.4","inject-loader":"^3.0.0","isparta-loader":"^2.0.0","jasmine-core":"^2.5.2","json-loader":"^0.5.4",karma:"^1.5.0","karma-coverage":"^1.1.1","karma-jasmine":"^1.0.2","karma-mocha":"^1.2.0","karma-phantomjs-launcher":"^1.0.4","karma-sinon-chai":"^1.2.0","karma-sourcemap-loader":"^0.3.7","karma-spec-reporter":"0.0.30","karma-webpack":"1.8.1",lolex:"^1.6.0",mocha:"^3.1.0",nightwatch:"^0.9.14",ora:"^1.2.0","phantomjs-prebuilt":"^2.1.13","selenium-server":"^3.3.1",shelljs:"^0.7.7",sinon:"^2.1.0","sinon-chai":"^2.9.0","url-loader":"^0.5.8",vue:"^2.3.0","vue-hot-reload-api":"^2.1.0","vue-html-loader":"^1.2.4","vue-loader":"^12.0.2","vue-style-loader":"^3.0.1","vue-template-compiler":"^2.3.0",webpack:"^1.13.2","webpack-dev-middleware":"^1.10.1","webpack-hot-middleware":"^2.17.1","webpack-merge":"1.1.1"},directories:{},dist:{shasum:"f0fe61892494325db8e2462cb0397b948b4434f4",tarball:"https://registry.npmjs.org/vue-chartjs/-/vue-chartjs-2.6.2.tgz"},engines:{node:">=6.9.0"},files:["src","dist","es"],gitHead:"25d37666877d4e472c00b5a056c135efe43ee693",greenkeeper:{ignore:["extract-text-webpack-plugin","karma-webpack","webpack","webpack-merge"]},homepage:"http://vue-chartjs.org","jsnext:main":"es/index.js",keywords:["ChartJs","Vue","Visualisation","Wrapper","Charts"],license:"MIT",main:"dist/vue-chartjs.js",maintainers:[{name:"apertureless",email:"netghost03@gmail.com"}],module:"es/index.js",name:"vue-chartjs",optionalDependencies:{},peerDependencies:{"chart.js":"^2.5.0",vue:"^2.3.0"},readme:"ERROR: No README data found!",repository:{type:"git",url:"git+ssh://git@github.com/apertureless/vue-chartjs.git"},scripts:{build:"yarn run release && yarn run build:es","build:es":"cross-env BABEL_ENV=es babel src --out-dir es",dev:"node build/dev-server.js",e2e:"node test/e2e/runner.js",lint:"eslint --ext .js,.vue src test/unit/specs test/e2e/specs",prepublish:"yarn run lint && yarn run test && yarn run build",release:"webpack --progress --hide-modules --config  ./build/webpack.release.js && NODE_ENV=production webpack --progress --hide-modules --config  ./build/webpack.release.min.js && webpack --progress --hide-modules --config  ./build/webpack.release.full.js && NODE_ENV=production webpack --progress --hide-modules --config  ./build/webpack.release.full.min.js",test:"npm run unit",unit:"karma start test/unit/karma.conf.js --single-run"},unpkg:"dist/vue-chartjs.full.min.js",version:"2.6.2"}},466:function(t,e,a){a(319);var s=a(5)(a(235),a(474),null,null);t.exports=s.exports},467:function(t,e,a){a(320);var s=a(5)(a(236),a(476),null,null);t.exports=s.exports},468:function(t,e,a){var s=a(5)(a(237),a(481),null,null);t.exports=s.exports},469:function(t,e,a){a(324);var s=a(5)(a(238),a(482),null,null);t.exports=s.exports},470:function(t,e,a){var s=a(5)(a(239),a(475),null,null);t.exports=s.exports},471:function(t,e,a){a(322);var s=a(5)(a(240),a(478),null,null);t.exports=s.exports},472:function(t,e,a){a(323);var s=a(5)(a(241),a(479),null,null);t.exports=s.exports},473:function(t,e,a){var s=a(5)(a(242),a(480),null,null);t.exports=s.exports},474:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"dash-form"},[a("md-layout",{attrs:{"md-gutter":""}},[a("md-layout",{attrs:{"md-flex":"30","md-flex-offset":"20"}},[t._v("\r\n\t\t  \t \t "+t._s(t.msg)+" \r\n\t\t  \t ")])],1),t._v(" "),a("md-layout",{attrs:{"md-gutter":""}},[a("md-layout",{attrs:{"md-flex":"100","md-align":"center"}},[a("md-button-toggle",{staticClass:"md-accent",attrs:{"md-single":""}},[a("md-button",{nativeOn:{click:function(e){t.$router.push({path:"/dashboard/effects"})}}},[t._v("Эффективность")]),t._v(" "),a("md-button",{nativeOn:{click:function(e){t.$router.push({path:"/dashboard/services"})}}},[t._v("Сервис")]),t._v(" "),a("md-button",{nativeOn:{click:function(e){t.$router.push({path:"/dashboard/settings"})}}},[t._v("Настройки")])],1)],1)],1),t._v(" "),a("md-layout",{staticClass:"dash-router",attrs:{"md-gutter":"","md-align":"center"}},[a("md-layout",{attrs:{"md-flex":"90","md-align":"center"}},[a("router-view")],1)],1)],1)},staticRenderFns:[]}},475:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"props"},[a("h1",[t._v(t._s(t.msg))])])},staticRenderFns:[]}},476:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"effects"},[a("md-layout",{attrs:{"md-gutter":""}},[a("md-layout",{attrs:{"md-flex":"60","md-flex-offset":"10"}},[a("md-button-toggle",{staticClass:"md-accent",attrs:{"md-single":""}},[a("md-button",{staticClass:"md-toggle",nativeOn:{click:function(e){t.generateData()}}},[t._v("Сегодня")]),t._v(" "),a("md-button",{nativeOn:{click:function(e){t.generateData()}}},[t._v("Вчера")]),t._v(" "),a("md-button",{nativeOn:{click:function(e){t.generateData()}}},[t._v("Неделя")]),t._v(" "),a("md-button",{nativeOn:{click:function(e){t.generateData()}}},[t._v("Месяц")]),t._v(" "),a("md-button",{nativeOn:{click:function(e){t.generateData()}}},[t._v("Квартал")]),t._v(" "),a("md-button",{nativeOn:{click:function(e){t.generateData()}}},[t._v("Год")]),t._v(" "),a("md-button",[t._v("19 фев - 17 мар 2017")])],1)],1)],1),t._v(" "),a("md-layout",{attrs:{"md-align":"end","md-gutter":""}},[a("md-layout",{attrs:{"md-flex":"30"}},[a("md-button-toggle",{staticClass:"md-accent",attrs:{"md-single":""}},[a("md-button",{staticClass:"md-icon-button",class:{"md-toggle":!t.showTable},nativeOn:{click:function(e){t.showTable=!1}}},[a("md-icon",[t._v("assessment")])],1),t._v(" "),a("md-button",{staticClass:"md-icon-button",class:{"md-toggle":t.showTable},nativeOn:{click:function(e){t.showTable=!0}}},[a("md-icon",[t._v("view_list")])],1)],1),t._v(" "),a("md-button",{staticClass:"md-icon-button"},[a("md-icon",[t._v("file_download")])],1),t._v(" "),a("md-button",{staticClass:"md-icon-button"},[a("md-icon",[t._v("share")])],1)],1)],1),t._v(" "),a("md-layout",{attrs:{"md-gutter":""}},[t.showTable?t._e():a("md-layout",{attrs:{"md-flex":"80","md-flex-offset":"10"}},[a("div",{staticClass:"chart-container"},[a("commitChart",{attrs:{width:750,height:500,chartData:this.dtc,options:this.chartOptions}})],1)]),t._v(" "),t.showTable?a("md-layout",{attrs:{"md-flex":"80","md-align":"center"}},[t._m(0)],1):t._e()],1)],1)},staticRenderFns:[function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("md-table",[a("md-table-header",[a("md-table-row",[a("md-table-head",[t._v("Показатель")]),t._v(" "),a("md-table-head",{attrs:{"md-numeric":""}},[t._v("Часы")]),t._v(" "),a("md-table-head",{attrs:{"md-numeric":""}},[t._v("%")])],1)],1),t._v(" "),a("md-table-body",[a("md-table-row",[a("md-table-cell",[t._v("План")]),t._v(" "),a("md-table-cell",[t._v("56")]),t._v(" "),a("md-table-cell",[t._v("100")])],1),t._v(" "),a("md-table-row",[a("md-table-cell",[t._v("Время включения")]),t._v(" "),a("md-table-cell",[t._v("49")]),t._v(" "),a("md-table-cell",[t._v("87,5")])],1),t._v(" "),a("md-table-row",[a("md-table-cell",[t._v("Время работы")]),t._v(" "),a("md-table-cell",[t._v("40")]),t._v(" "),a("md-table-cell",[t._v("71,4")])],1),t._v(" "),a("md-table-row",[a("md-table-cell",[t._v("Свет")]),t._v(" "),a("md-table-cell",[t._v("56")]),t._v(" "),a("md-table-cell",[t._v("100")])],1),t._v(" "),a("md-table-row",[a("md-table-cell",[t._v("Завеса")]),t._v(" "),a("md-table-cell",[t._v("35")]),t._v(" "),a("md-table-cell",[t._v("65,5")])],1),t._v(" "),a("md-table-row",[a("md-table-cell",[t._v("Вентиляция")]),t._v(" "),a("md-table-cell",[t._v("30")]),t._v(" "),a("md-table-cell",[t._v("53,6")])],1),t._v(" "),a("md-table-row",[a("md-table-cell",[t._v("Нет завеса-насос")]),t._v(" "),a("md-table-cell",[t._v("2")]),t._v(" "),a("md-table-cell",[t._v("3,6")])],1),t._v(" "),a("md-table-row",[a("md-table-cell",[t._v("Нет завеса-уровень воды")]),t._v(" "),a("md-table-cell",[t._v("8")]),t._v(" "),a("md-table-cell",[t._v("14,3")])],1),t._v(" "),a("md-table-row",[a("md-table-cell",[t._v("Фильтры забиты")]),t._v(" "),a("md-table-cell",[t._v("1")]),t._v(" "),a("md-table-cell",[t._v("1,8")])],1),t._v(" "),a("md-table-row",[a("md-table-cell",[t._v("Вибрация")]),t._v(" "),a("md-table-cell",[t._v("0")]),t._v(" "),a("md-table-cell",[t._v("0")])],1)],1)],1)}]}},477:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{attrs:{id:"app"}},[a("md-toolbar",{staticClass:"md-dense"},[a("md-button",{staticClass:"md-icon-button",nativeOn:{click:function(e){t.$router.push({name:"Home"})}}},[a("md-icon",[t._v("cloud")])],1),t._v(" "),a("h2",{staticClass:"md-title",staticStyle:{flex:"1"}},[t._v("BrainBox")]),t._v(" "),t.user.authenticated?a("md-button",{staticClass:"md-icon-button",nativeOn:{click:function(e){t.$router.push({path:"/dashboard/effects"})}}},[a("md-icon",[t._v("dashboard")])],1):t._e(),t._v(" "),t.user.authenticated?a("md-button",{staticClass:"md-icon-button",nativeOn:{click:function(e){t.$router.push({name:"Properties"})}}},[a("md-icon",[t._v("settings")])],1):t._e(),t._v(" "),t.user.authenticated?a("md-button",{staticClass:"md-icon-button",nativeOn:{click:function(e){t.logout()}}},[a("md-icon",[t._v("exit_to_app")])],1):t._e()],1),t._v(" "),a("router-view")],1)},staticRenderFns:[]}},478:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"services md-align-center"},[a("md-layout",{attrs:{"md-gutter":"","md-align":"center"}},[a("md-layout",{attrs:{"md-flex":"35","md-align":"center"}},[a("h2",[t._v("Журнал событий")]),t._v(" "),a("md-list",{staticClass:"custom-list md-triple-line"},[a("md-list-item",{staticClass:"md-button"},[a("div",{staticClass:"md-list-text-container"},[a("span",[t._v("Ali Connors")]),t._v(" "),a("span",[t._v("Brunch this weekend?")]),t._v(" "),a("p",[t._v("I'll be in your neighborhood doing errands...")])]),t._v(" "),a("md-button",{staticClass:"md-icon-button md-list-action"},[a("md-icon",{staticClass:"md-primary"},[t._v("close")])],1),t._v(" "),a("md-divider",{staticClass:"md-inset"})],1),t._v(" "),a("md-list-item",{staticClass:"md-button"},[a("div",{staticClass:"md-list-text-container"},[a("span",[t._v("me, Scott, Jennifer")]),t._v(" "),a("span",[t._v("Summer BBQ")]),t._v(" "),a("p",[t._v("Wish I could come, but I'm out of town ...")])]),t._v(" "),a("md-button",{staticClass:"md-icon-button md-list-action"},[a("md-icon",[t._v("close")])],1),t._v(" "),a("md-divider",{staticClass:"md-inset"})],1),t._v(" "),a("md-list-item",{staticClass:"md-button"},[a("div",{staticClass:"md-list-text-container"},[a("span",[t._v("Sandra Adams")]),t._v(" "),a("span",[t._v("Oui oui")]),t._v(" "),a("p",[t._v("Do you have Paris recommendations ...")])]),t._v(" "),a("md-button",{staticClass:"md-icon-button md-list-action"},[a("md-icon",[t._v("close")])],1),t._v(" "),a("md-divider",{staticClass:"md-inset"})],1),t._v(" "),a("md-list-item",{staticClass:"md-button"},[a("div",{staticClass:"md-list-text-container"},[a("span",[t._v("Trevor Hansen")]),t._v(" "),a("span",[t._v("Order confirmation")]),t._v(" "),a("p",[t._v("Thank you for your recent order from ...")])]),t._v(" "),a("md-button",{staticClass:"md-icon-button md-list-action"},[a("md-icon",[t._v("close")])],1),t._v(" "),a("md-divider",{staticClass:"md-inset"})],1)],1)],1),t._v(" "),a("md-layout",{attrs:{"md-flex":"20","md-align":"center"}},[a("radial-gauge",{attrs:{options:t.radOptions("Насос водной завесы"),value:t.radialValue}})],1),t._v(" "),a("md-layout",{attrs:{"md-flex":"20","md-align":"center"}},[a("radial-gauge",{attrs:{options:t.radOptions("Двигатель вентилятора"),value:t.radialValue2}})],1),t._v(" "),a("md-layout",{attrs:{"md-flex":"20","md-align":"center"}},[a("radial-gauge",{attrs:{options:t.radOptions("Лампы освещения"),value:t.radialValue3}})],1)],1)],1)},staticRenderFns:[]}},479:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"settings"},[a("md-layout",{attrs:{"md-gutter":"","md-align":"center"}},[a("md-layout",{attrs:{"md-flex":"70"}},[a("h1",[t._v(t._s(t.msg))]),t._v(" "),a("md-card",{staticClass:"crd",attrs:{"md-with-hover":""}},[a("md-card-header",[a("div",{staticClass:"md-title"},[t._v("Title goes here")]),t._v(" "),a("div",{staticClass:"md-subhead"},[t._v("Subtitle here")])]),t._v(" "),a("md-card-content",[t._v("\n          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio itaque ea, nostrum odio. Dolores, sed accusantium quasi non, voluptas eius illo quas, saepe voluptate pariatur in deleniti minus sint. Excepturi.\n        ")]),t._v(" "),a("md-card-actions",[a("md-button",[t._v("Action")]),t._v(" "),a("md-button",[t._v("Action")])],1)],1),t._v(" "),a("md-card",{staticClass:"crd",attrs:{"md-with-hover":""}},[a("md-card-header",[a("div",{staticClass:"md-title"},[t._v("Title goes here")]),t._v(" "),a("div",{staticClass:"md-subhead"},[t._v("Subtitle here")])]),t._v(" "),a("md-card-content",[t._v("\n          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio itaque ea, nostrum odio. Dolores, sed accusantium quasi non, voluptas eius illo quas, saepe voluptate pariatur in deleniti minus sint. Excepturi.\n        ")]),t._v(" "),a("md-card-actions",[a("md-button",[t._v("Action")]),t._v(" "),a("md-button",[t._v("Action")])],1)],1)],1)],1)],1)},staticRenderFns:[]}},480:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement;return(t._self._c||e)("canvas",{staticClass:"canvas-gauges"})},staticRenderFns:[]}},481:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"hello"},[a("md-layout",{attrs:{"md-align":"center","md-gutter":"10"}},[a("md-layout",{attrs:{"md-flex":"35","md-align":"center"}},[a("h1",[t._v(t._s(t.msg))])])],1),t._v(" "),a("md-layout",{attrs:{"md-align":"center","md-gutter":"10"}},[a("md-layout",{attrs:{"md-flex":"35","md-align":"center"}},[a("md-button",{nativeOn:{click:function(e){t.$router.push({name:"Login"})}}},[t._v("Вход")])],1)],1)],1)},staticRenderFns:[]}},482:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"login-form"},[a("md-layout",{attrs:{"md-gutter":""}},[a("md-layout",{attrs:{"md-flex":"33","md-flex-medium":"33","md-flex-offset":"33"}},[a("md-card",{staticStyle:{width:"100%"},attrs:{"md-with-hover":""}},[a("md-card-content",[a("form",[a("md-input-container",[a("md-icon",[t._v("account_circle")]),t._v(" "),a("label",[t._v("Логин")]),t._v(" "),a("md-input",{model:{value:t.credentials.username,callback:function(e){t.credentials.username=e},expression:"credentials.username"}})],1),t._v(" "),a("md-input-container",{attrs:{"md-has-password":""}},[a("md-icon",[t._v("lock")]),t._v(" "),a("label",[t._v("Пароль")]),t._v(" "),a("md-input",{attrs:{type:"password"},model:{value:t.credentials.password,callback:function(e){t.credentials.password=e},expression:"credentials.password"}})],1),t._v(" "),a("md-layout",{attrs:{"md-align":"center"}},[a("md-button",{nativeOn:{click:function(e){t.submit()}}},[t._v("Войти")])],1),t._v(" "),t.error?a("md-card",{staticClass:"md-warn"},[a("p",[t._v(t._s(t.error))])]):t._e()],1)])],1)],1)],1)],1)},staticRenderFns:[]}},485:function(t,e){}},[232]);
//# sourceMappingURL=app.85fcd6e0fd44144a5314.js.map