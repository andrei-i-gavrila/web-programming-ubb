function changePieces(firstPiece, secondPiece) {
    let firstStyle = $(firstPiece).attr("style");
    $(firstPiece).attr("style", $(secondPiece).attr("style"));
    $(secondPiece).attr("style", firstStyle);

}

$(".puzzle").each((i, puzzle) => {
    let imageUrl = $(puzzle).attr('src');
    let puzzleWidth = $(puzzle).width();
    let puzzleHeight = $(puzzle).height();
    let puzzleContainer = $("<div class='container' style='width: " + puzzleWidth + "px; height: " + puzzleHeight + "px;'></div>");
    for (let i = 0; i < 4; i++) {
        let yPercent = (i * puzzleWidth / 4).toString() + "px";
        for (let j = 0; j < 4; j++) {
            let xPercent = (j * puzzleHeight / 4).toString() + "px";
            $("<div draggable='true' class='puzzle-image' style='background: url(" + imageUrl + ") " + xPercent + " " + yPercent + ";'>").appendTo(puzzleContainer);
        }
    }

    $(puzzle).after(puzzleContainer)
});

let draggedElement = null;
$(".puzzle-image")
    .on("dragstart", () => draggedElement = event.target)
    .on("drop", () => {
        changePieces(event.target, draggedElement);
        draggedElement = null;
    })
    .on("dragenter", () => event.preventDefault())
    .on("dragover", () => event.preventDefault())
    .each((i, piece) => {
        let targetPiece = $('.puzzle-image').get()[Math.floor(Math.random()*16)];
        changePieces(piece, targetPiece);
    });