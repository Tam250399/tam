
    var isPlayed = false;
    var url = null;
    var music = new Audio(url);
    function PlayMusic(idMusic){
        music.pause();
        $.ajax({
            method: "GET",
            url: "MusicServlet",
            data: {ac:"PlayMusic",id : idMusic}
        }).done(function (response) {
            url = response;
            music = new Audio(response);
            document.getElementById("Audio").innerHTML = "<audio controls autoplay style='width: 100%'>"+"<source src = '"+response+"'"+">"+"<audio/>"
        });
    }
function ListGoat(){
    music.pause();
        $.ajax({
            method: "GET",
            url: "MusicServlet",
            data: {ac:"Goat"}
        }).done(function (response) {
    check(response)

});

}
    function ListDuck(){
    music.pause();
        $.ajax({
            method: "GET",
            url: "MusicServlet",
            data: {ac:"Duck"}
        }).done(function (response) {
            check(response)

    })
}
    function ListHorse(){
    music.pause();
        $.ajax({
            method: "GET",
            url: "MusicServlet",
            data: {ac:"Horse"}
        }).done(function (response) {
    check(response)

    })
    }
    function ListSheep(){
    music.pause();
        $.ajax({
            method: "GET",
            url: "MusicServlet",
            data: {ac:"Sheep"}
        }).done(function (response) {
    check(response)

    })
}
function check(response) {
    // Playlist array
    var files = response

    // Current index of the files array
    var i = 0;
     document.getElementById("Audio").innerHTML = "<audio controls autoplay style='width: 100%'>"+"<source src = '"+files[0]+"'"+">"+"<audio/>"
    // Get the audio element
    var music_player = document.querySelector("#Audio audio");

    // function for moving to next audio file
    function next() {
        // Check for last audio file in the playlist
        if (i === files.length - 1) {
            i = 0;
        } else {
            i++;
        }

        // Change the audio element source
        music_player.src = files[i];
    }

    // Check if the player is selected
    if (music_player === null) {
        throw "Playlist Player does not exists ...";
    } else {
        // Start the player
        music_player.src = files[i];

        // Listen for the music ended event, to play the next audio file
        music_player.addEventListener('ended', next, false)
    }
    };