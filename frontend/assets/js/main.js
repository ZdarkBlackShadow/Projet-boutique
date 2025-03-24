const url = 'http://localhost:3000';

function getAllHadware() {
    fetch(`${url}/hardwares`)
    .then(res => res.json())
    .then(data => {
        console.log(data);
    })
    .catch(err => console.log(err));
}

getAllHadware();