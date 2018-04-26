function getOrientation(height, width) {
    console.log(height + " " + width);
    return height > width ? "portrait" : "landscape";
}

function processImage(image) {
    let $image = $(image);
    $image.parent().addClass(getOrientation(image.naturalHeight, image.naturalWidth));
    $image.addClass('image-processed');
}

function setupCarousel(index, image) {
    let $image = $(image);
    let $parent = $image.parent();

    $parent.attr('id', 'image-' + index.toString());
    let carouselItem = $("<div id='carousel-image-" + index.toString() + "' class='carousel-item'></div>");
    carouselItem.append($image.clone());

    $("#carousel-images").append(carouselItem);
}

$(window).on('load', () => {
    $('.image-container > img').each((i, image) => {
        processImage(image);
        setupCarousel(i, image);
    });
});

$('.image-container').click((event) => {
    $("#carousel-" + event.target.parentElement.id).addClass('active');
    $("#carousel-modal").modal('show');
});


$('#carousel-modal').on('hidden.bs.modal', function () {
    $('.active').removeClass('active');
});