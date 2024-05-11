'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/1.png": "4cf090181295175f7043ff81f3fd1bc8",
"assets/2.png": "4840aa3705eb84177e359fc396ea4ed3",
"assets/3.png": "765898ab1c8462b6423423a5ad10d4a1",
"assets/4.png": "6129f3029561845f6d6b70b63be19772",
"assets/5.png": "6c12d2882a6cddd84689b81a2f41afca",
"assets/6.png": "1d42c71aa810a284be830f90563bc1f9",
"assets/7.png": "51605356d64592de673aa42a0f147909",
"assets/AssetManifest.bin": "aa56adef41547520c77cd6ada2769353",
"assets/AssetManifest.bin.json": "de8b9b262a9e5f7fb82833102f86e901",
"assets/AssetManifest.json": "446fbaa1fcc625d3ddd1ba8478112cdf",
"assets/assets/1.png": "4cf090181295175f7043ff81f3fd1bc8",
"assets/assets/2.png": "4840aa3705eb84177e359fc396ea4ed3",
"assets/assets/3.png": "765898ab1c8462b6423423a5ad10d4a1",
"assets/assets/4.png": "6129f3029561845f6d6b70b63be19772",
"assets/assets/5.png": "6c12d2882a6cddd84689b81a2f41afca",
"assets/assets/6.png": "1d42c71aa810a284be830f90563bc1f9",
"assets/assets/7.png": "51605356d64592de673aa42a0f147909",
"assets/assets/fifo.png": "2bda10754e04fe80aa5911395b4e2ec5",
"assets/assets/fifo1.png": "08601be7dfbb7d366871812264f1ee33",
"assets/assets/fonts/WorkSans-Bold.ttf": "1559ffc7cf61cbae7ea55a250722009c",
"assets/assets/fonts/WorkSans-Regular.ttf": "a3d6c7f7606fc33a6ab5bed9688d1fe8",
"assets/assets/lifo.png": "e6e0fc3d6c40cadee86da8361c9f24df",
"assets/assets/lifo1.png": "fd471b2661505e16d53fbe5f120fda74",
"assets/assets/lru.png": "4d370eae2b433a23ae7f56162ba4dcef",
"assets/assets/lru1.png": "166a559c9cf88a09232f73c80ad8fe97",
"assets/fifo.png": "2bda10754e04fe80aa5911395b4e2ec5",
"assets/fifo1.png": "08601be7dfbb7d366871812264f1ee33",
"assets/FontManifest.json": "6b12e88ce2ae3bcc631cda7b0e76bed9",
"assets/fonts/Inconsolata_Condensed-Bold.ttf": "2aef665ed618b898e7f0a1740d687164",
"assets/fonts/Inconsolata_Condensed-Regular.ttf": "62072edffddfe9450411c576e735c2fa",
"assets/fonts/MaterialIcons-Regular.otf": "7cee375ceccaffa698a6dda2bc6737cf",
"assets/fonts/WorkSans-Bold.ttf": "1559ffc7cf61cbae7ea55a250722009c",
"assets/fonts/WorkSans-Regular.ttf": "a3d6c7f7606fc33a6ab5bed9688d1fe8",
"assets/lifo.png": "e6e0fc3d6c40cadee86da8361c9f24df",
"assets/lifo1.png": "fd471b2661505e16d53fbe5f120fda74",
"assets/lru.png": "4d370eae2b433a23ae7f56162ba4dcef",
"assets/lru1.png": "166a559c9cf88a09232f73c80ad8fe97",
"assets/NOTICES": "ea5f9aabe053e93044db7729d4841d07",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "ebfc42ea5121b3009a6ea55ca1c80120",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6d841e41280d2f1cc95ea740094cc1c4",
"/": "6d841e41280d2f1cc95ea740094cc1c4",
"main.dart.js": "73afceb272dad8dc5d30063bbc6e2432",
"manifest.json": "466f7fee13f25db2faf947033fd8883c",
"version.json": "41698bb3fe009532dd37697429003e89"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
