'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "710bff08a372197cb4ee2ce228d3ed49",
"assets/assets/fonts/Montserrat-Bold.ttf": "d14ad1035ae6da4e5a71eca362a8d696",
"assets/assets/fonts/Montserrat-Light.ttf": "a17f43cc60643d965636985afc00a221",
"assets/assets/fonts/Montserrat-Regular.ttf": "34de1239b12123b85ff1a68b58835a1f",
"assets/assets/images/axis.png": "9121a8bd84af8e0f9aa912900bb8b5e3",
"assets/assets/images/background.png": "e5264887c300c865b71d0dcc59df431e",
"assets/assets/images/background2.png": "cb629a9bfac726c7a1ad926636fdc649",
"assets/assets/images/background3.png": "f4515613d84e94f35bb721e1134bbce5",
"assets/assets/images/computer.png": "a573132ff2f616dd3e38066c0646adfa",
"assets/assets/images/icon/icon_app.png": "1c441a90b1c50f839376d1d693688f06",
"assets/assets/images/icons-new/icon_calendar.png": "00c1c3ea2597f6c8e60378b045f36655",
"assets/assets/images/icons-new/icon_change_m-pin.png": "f7b5f5b6c0006746e1762100802d964e",
"assets/assets/images/icons-new/icon_eye%2520password.png": "82ea6aed899f951fc3f4ac587373558f",
"assets/assets/images/icons-new/icon_hapus_daftar_transfer.png": "b472adff0600f972a57ef45ee34f1c39",
"assets/assets/images/icons-new/icon_m-pin.png": "c45cbb4aa5152c3d9deb11121db04f82",
"assets/assets/images/icons-new/icon_password.png": "4929c4d0e8b0d45b58d7827e77306a81",
"assets/assets/images/icons-new/icon_pendaftaran-05.png": "8af439c4de74ec9b8a18806b2cfd8bd9",
"assets/assets/images/icons-new/icon_terverifikasi.png": "6af9081122435f63cc8c118e84b51c90",
"assets/assets/images/icons-new/icon_verifikasi.png": "4ce385236a496b772d72397b7fbe2a4b",
"assets/assets/images/icons-new/menuicon_ask.png": "76f88dae21aa998abf9481c56cf10b64",
"assets/assets/images/icons-new/menuicon_info_deposito.png": "b3a75f8deb40db3b8c04de9931228888",
"assets/assets/images/icons-new/menuicon_info_rekening.png": "4855ab891af1b5050368fb629d3bbf89",
"assets/assets/images/icons-new/menuicon_multi_transfer.png": "bc1401dde381e2de7b44ab70414ec402",
"assets/assets/images/icons-new/menuicon_mutasi_rekening.png": "8c2b746d0af8cde7b9e24408df1c2336",
"assets/assets/images/icons-new/menuicon_pembayaran.png": "4dc0cced55cf7c9c7c6c3fdf37d7d4f5",
"assets/assets/images/icons-new/menuicon_pinjaman.png": "6a88c2f1c42bd058f53e53edfa4d4e8a",
"assets/assets/images/icons-new/menuicon_portfolio.png": "51c6df3b2e8f1236a71e6edb6e888143",
"assets/assets/images/icons-new/menuicon_transfer.png": "db9d7b01879dc28e560ade76e4671d72",
"assets/assets/images/icons-new/no.png": "7e09cfbec5a3253fc362001fb5093718",
"assets/assets/images/icons-new/no_transparent.png": "edacf70a9668faa9a5ac36ee46cdc6ef",
"assets/assets/images/icons-new/portfolio_deposito.png": "c6bce2e0aa3d469383a9627950a904b7",
"assets/assets/images/icons-new/portfolio_pinjaman.png": "da097e08ca8e2cfc24da7997201a23bb",
"assets/assets/images/icons-new/portfolio_tabungan.png": "83881bd21c7fd1011d1c42c5905b0e98",
"assets/assets/images/icons-new/trash.png": "115667784529a2379bbbb8ecac5376b0",
"assets/assets/images/icons-new/yes.png": "b967289eb471ea141cd8816165dab74c",
"assets/assets/images/icons-new/yes_transparent.png": "939b1237f4c4537b35774fa7b680dc5d",
"assets/assets/images/illustration/illustration-1.png": "fe71adcc8c40782af7b7555f0ffd44c1",
"assets/assets/images/illustration/illustration-2.png": "5ad69c7624875b76c84eebb06806ff46",
"assets/assets/images/illustration/illustration-3.png": "af558689fdcffd35185981e4838029a0",
"assets/assets/images/illustration/illustration-4.png": "9914b22d6fbf67208c7d360252861063",
"assets/assets/images/illustration/illustration-5.png": "f1fdf5d42f2d9395cfcbf6530f7d531e",
"assets/assets/images/illustration/illustration-6.png": "402d0f650730185cbc0832209cbe67ab",
"assets/assets/images/indosat.png": "20ade5b1a91580f1a44631fa7aa5314a",
"assets/assets/images/no_wifi.png": "a710f01e387fa06caca0cfddbbbfabe4",
"assets/assets/images/product_mcore.png": "107b2c39d70a4897acf17e108df7610e",
"assets/assets/images/smart.png": "0e3832ca808006770c2bf67bc98a93d8",
"assets/assets/images/telkomsel.png": "163f7320a2a1b14ae9361de24e792df5",
"assets/assets/images/tri.png": "8e78405e501cb93c6a24477e4fb6c54d",
"assets/assets/images/wbk-large.jpeg": "187701d2727f0f7fc3a1c2f6fc413066",
"assets/assets/images/wbk-small.jpeg": "712f7106556ef235aa02754063787ead",
"assets/assets/images/wbk-small1.jpeg": "712f7106556ef235aa02754063787ead",
"assets/assets/images/WINCore%2520copy.png": "da80a36f3e816d4fff5bb7e84eb8d8ae",
"assets/assets/images/WINCore%2520copy1.png": "72f87d2032644fa2ce5222d842c9429f",
"assets/assets/images/WINCore.jpeg": "9fc2e67a2a1bf023c67b24412c2ffb7b",
"assets/assets/images/wincore_cooperation.png": "701a840b888da51fa3de84d53e5d745e",
"assets/assets/images/wincore_microbanking.png": "988e48ea64f7e663476fef15907fd186",
"assets/assets/images/wincore_syariah.png": "300fd785cdd409b58f42aa3373196c2c",
"assets/assets/images/xl.png": "0fcd128d539ac63a418bedfe13e3bcbe",
"assets/FontManifest.json": "09d25d6f68497a38e2701ff1c5ca95bb",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "499e61655d6a9a6609b45d7ba3e0aade",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/nb_utils/fonts/LineAwesome.ttf": "bcc78af7963d22efd760444145073cd3",
"assets/packages/rflutter_alert/assets/images/2.0x/close.png": "abaa692ee4fa94f76ad099a7a437bd4f",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_error.png": "2da9704815c606109493d8af19999a65",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_info.png": "612ea65413e042e3df408a8548cefe71",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_success.png": "7d6abdd1b85e78df76b2837996749a43",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_warning.png": "e4606e6910d7c48132912eb818e3a55f",
"assets/packages/rflutter_alert/assets/images/3.0x/close.png": "98d2de9ca72dc92b1c9a2835a7464a8c",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_error.png": "15ca57e31f94cadd75d8e2b2098239bd",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_info.png": "e68e8527c1eb78949351a6582469fe55",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_success.png": "1c04416085cc343b99d1544a723c7e62",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_warning.png": "e5f369189faa13e7586459afbe4ffab9",
"assets/packages/rflutter_alert/assets/images/close.png": "13c168d8841fcaba94ee91e8adc3617f",
"assets/packages/rflutter_alert/assets/images/icon_error.png": "f2b71a724964b51ac26239413e73f787",
"assets/packages/rflutter_alert/assets/images/icon_info.png": "3f71f68cae4d420cecbf996f37b0763c",
"assets/packages/rflutter_alert/assets/images/icon_success.png": "8bb472ce3c765f567aa3f28915c1a8f4",
"assets/packages/rflutter_alert/assets/images/icon_warning.png": "ccfc1396d29de3ac730da38a8ab20098",
"canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "c6e8a618940a67429fa6eb170534457d",
"/": "c6e8a618940a67429fa6eb170534457d",
"main.dart.js": "157d4e62b06b41446d81412675492439",
"manifest.json": "c2187f042248530a574ea818a65aa88b",
"version.json": "812601d343b440bf662a106dffd897e5"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
