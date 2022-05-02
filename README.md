# GalleryImages
<img src='Screenshot/pic.png' width=300 />
This app can show images on the screen. I've created it based on the clean architecture and MVVM-C pattern.
<br>
the flow application handles by coordinator pattern.
</br>

<p>
  At the first, App runs and fetch data from the service. after that All data can cache on the mongodb. I use realm-MongoDB for caching data.
</p>

# Architecture
Based on the clean architecture

<b>Kiliaro</b>
<br>
    -------> <b>Application</b> // UI elements and pages
    </br>
    <br>
    -------> <b>APIPlaform</b> // Platform Layer
    </br>
    <br>
    -------> <b>DBPlatform</b> // Platform Layer
        </br>
    <br>
    -------> <b>RepositoryPlatform</b> // Platform Layer
        </br>
    <br>
    -------> <b>Domain</b> // Domain Layer include use cases and entites
        </br>
    <br>
