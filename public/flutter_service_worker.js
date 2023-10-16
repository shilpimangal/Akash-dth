'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "f10647647d2981f45c1a58d84a1b4945",
"index.html": "23f180f17ddb6229ab741aab93019621",
"/": "23f180f17ddb6229ab741aab93019621",
"main.dart.js": "aee24303c397538776259db279e8e300",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "a444a472edf3c20f487eb6010e6437fa",
"assets/AssetManifest.json": "82005c969a0b08d7130fd2911b77dfa7",
"assets/NOTICES": "b1fc47dc7a3a845304c0dba5e72dfcdf",
"assets/FontManifest.json": "569adbcb65082f8c8fed9d0f91829361",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "f120a6c149a064f1d8504d2ae8ddda63",
"assets/fonts/MaterialIcons-Regular.otf": "4028b5493efc8ae426eed06b9f2da0d2",
"assets/assets/language/en.json": "a28fe40c210b43cdac290051d63132ec",
"assets/assets/language/es.json": "7df24da5d4c4fc22f47e6e20c2e38505",
"assets/assets/language/ar.json": "104589d211bc73fb05216f87b446d6ce",
"assets/assets/image/aboutakash.png": "7281b5a06c9fd4daa311d1f47ba17f22",
"assets/assets/image/privacypolicy.png": "7c472df7299c1e0990e8aff7de60c5c3",
"assets/assets/image/loyaltyprogram.png": "2d46fe2d1cdc89d4c18ebfcc36968933",
"assets/assets/image/settings.png": "a847f187dbbd57e38c0497cf70464b62",
"assets/assets/image/subscriptiondetails.png": "a16871e594bdf645d8df70ec010fb682",
"assets/assets/image/home_icon.png": "f2f1bfab3904f37fdab90b1a934138ff",
"assets/assets/image/akash_logo_white.png": "6a875a5315d6beadfb74551343e79c34",
"assets/assets/image/Iconawesomehandshelping.png": "0409d31a8af397972f570624d5e490ad",
"assets/assets/image/Icon%2520metro-location.png": "ea55f822cf73bcba1806cfe8fd1110ee",
"assets/assets/image/tutorial.png": "d96ea091721a17c5833987af6bfee5d1",
"assets/assets/image/menu.png": "e43efbc8c4ee6292ece6ab75c97eb6fd",
"assets/assets/image/logo.png": "5346966dd9eb660384b26da19d9ef2b6",
"assets/assets/image/home_logo_home.png": "e38b5f6dea10200cd86657333368803d",
"assets/assets/image/4.png": "60769cdf5d0947065925b9ac8e9936d8",
"assets/assets/image/6.png": "b43b84754a811d8c35557826551cff64",
"assets/assets/image/2.png": "efefe36749832c46cc2729525766c060",
"assets/assets/image/chat.png": "bc0c9add6e4401c852f6d1bef180b9ce",
"assets/assets/image/3.png": "8738fbbbea8f66d753da4483b1403c5b",
"assets/assets/image/newsandevents.png": "e94c5cef37a1118e51fcdba68a3c4c62",
"assets/assets/image/1.png": "6cb4f7b211be2146ab24771c98d39dec",
"assets/assets/image/termsandconditions.png": "1586bf7180747ce599bd8b8338ca2818",
"assets/assets/image/subscriptioncalculator.png": "eabdfbf44ab046f3ffe24f91069bb4a8",
"assets/assets/font/Roboto-Medium.ttf": "b2d307df606f23cb14e6483039e2b7fa",
"assets/assets/font/Roboto-Regular.ttf": "f36638c2135b71e5a623dca52b611173",
"assets/assets/font/Roboto-Bold.ttf": "9ece5b48963bbc96309220952cda38aa",
"assets/assets/font/Roboto-Black.ttf": "301fe70f8f0f41c236317504ec05f820",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "1165572f59d51e963a5bf9bdda61e39b",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "19d8b35640d13140fe4e6f3b8d450f04",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
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
