// canvas 객체 생성
var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

// html의 drawImage() 메소드 사용
// 이미지 width나 height가 클 경우 캔버스에 맞춰서 그리도록 사전에 처리를 해주는 함수
function drawImageData(image) {
    image.height *= canvas.offsetWidth / image.width;
    image.width = canvas.offsetWidth;
	
    if(image.height > canvas.offsetHeight){
        image.width *= canvas.offsetHeight / image.height;
        image.height = canvas.offsetHeight;
    }

    ctx.drawImage(image, 0, 0, image.width, image.height);
    console.log(ctx.getImageData(0,0, canvas.width, canvas.height));
    
}
$('#save').on('click', function () {
    var imgDataUrl  = canvas.toDataURL('image/png');
	console.log(imgDataUrl );
	
	var blobBin  = atob(imgDataUrl.split(',')[1]);
	var array = [];
    for (var i = 0; i < blobBin.length; i++) {
        array.push(blobBin.charCodeAt(i));
    }
    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
    var formdata = new FormData();	// formData 생성
    formdata.append("file", file);	// file data 추가
    console.log(blobBin);
});
$('#loadButton').on('change', function (e) {
    var file = e.target.files[0];
    var fileReader = new FileReader();

    fileReader.onload = function (e) {
        var image = new Image();
        image.src = e.target.result;
        image.onload = function () {
            drawImageData(image);
        }
    };

    fileReader.readAsDataURL(file);
});

//inverter filter

function invertFilter(pixels) {
    var d = pixels.data;
    for(var i=0; i<pixels.data.length; i+=4 ){
        d[i] = 255 - d[i];     // R
        d[i+1] = 255 - d[i+1]; // G
        d[i+2] = 255 - d[i+2]; // B
        d[i+3] = 255;          // Alpha
    }
    return pixels;
}
$('#filterButton1').on('click', function () {
    // imageData를 가져온다.
    var pixels = ctx.getImageData(0,0, canvas.width, canvas.height);

    // image processing
    var filteredData = invertFilter(pixels, 100);

    // Canvas에 다시 그린다.
    ctx.putImageData(filteredData, 0 , 0);
});

//brightnessFilter(검은색 칠해짐...수정해야함)
$('#filterButton2').on('click', function () {
    // imageData를 가져온다.
    var pixels = ctx.getImageData(0,0, canvas.width, canvas.height);

    // image processing
    var filteredData = brightnessFilter(pixels);
    
    // Canvas에 다시 그린다.
    ctx.putImageData(filteredData, 0 , 0);
});

function brightnessFilter(pixels, value) {
    var d = pixels.data;
    for(var i =0; i< d.length; i+=4){
        d[i] += value/3;
        d[i+1] += value/3;
        d[i+2] += value/3;
    }
    return pixels;
}

//grey filter
$('#filterButton3').on('click', function () {
    // imageData를 가져온다.
    var pixels = ctx.getImageData(0,0, canvas.width, canvas.height);

    // image processing
    var filteredData = grayscaleFilter(pixels);

    // Canvas에 다시 그린다.
    ctx.putImageData(filteredData, 0 , 0);
});

function grayscaleFilter(pixels) {
    var d = pixels.data;
    for(var i =0; i< d.length; i+=4){
        var r = d[i];
        var g = d[i+1];
        var b = d[i+2];

        var v = 0.2126*r + 0.7152*g + 0.0722*b;  // 보정값
        d[i] = d[i+1] = d[i+2] = v               // RBG 색을 같게 맞추자
    }
    return pixels;
}

//Sepia Filter
$('#filterButton4').on('click', function () {
    // imageData를 가져온다.
    var pixels = ctx.getImageData(0,0, canvas.width, canvas.height);

    // image processing
    var filteredData = sepiaFilter(pixels);

    // Canvas에 다시 그린다.
    ctx.putImageData(filteredData, 0 , 0);
});

function sepiaFilter(pixels) {
    var d = pixels.data;
    for(var i =0; i< d.length; i+=4){
        var r = d[i];
        var g = d[i+1];
        var b = d[i+2];

        d[i] = r*0.3588 + g*0.7044 + b*0.1368;
        d[i+1] = r*0.2990 + g*0.5870 + b*0.1140;
        d[i+2] = r*0.2392 + g*0.4696 + b*0.0912;
    }
    return pixels;
}


