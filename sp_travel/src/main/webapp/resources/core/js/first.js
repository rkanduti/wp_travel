function populatePage() {
    drawGraph();
}

function drawGraph() {
    
    var x = ["June", "July", "Aug.", "Sept.", "Oct.", "Nov."];
    var y = [3, 2, 4, 4, 1, 3];

    var offset = 30;
    var canvas = document.getElementById("canvas");
    var graphdiv = document.getElementById("graph");
    var ctx = canvas.getContext("2d");

    canvas.style.backgroundColor = 'rgba(158, 167, 184, 0.2)';
    ctx.canvas.width = graphdiv.offsetWidth;
    ctx.canvas.height = graphdiv.offsetHeight;

    ctx.font = 'bold 11px Arial';

    var width = ctx.canvas.width - offset*2;
    var height = ctx.canvas.height - offset*2;

    var max = Math.max.apply(Math, y);
    var stepX = width/x.length * 0.8;
    var stepY = height/max;

    ctx.lineWidth=2;

    ctx.strokeStyle = '#000000';
    ctx.beginPath();
    ctx.moveTo(offset, 5);
    ctx.lineTo(offset, offset + height);
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(offset, offset + height);
    ctx.lineTo(width + offset, offset + height);
    ctx.stroke();

    ctx.lineWidth=0.5;

    for (var i = 1; i <= max; i++) {
        var y1 = offset + height - i*stepY;
        ctx.fillText(i, 12, y1);

        ctx.beginPath();
        ctx.moveTo(offset, y1);
        ctx.lineTo(width + offset, y1);
        ctx.stroke();
    }

    for (var i = 1; i < x.length; i++) {

        ctx.strokeStyle = '#0000FF';
        ctx.lineWidth=2;
        var x1 = offset + i*stepX;
        var x2 = offset + (i+1)*stepX;
        var y1 = offset + height - Math.round(y[i-1]*stepY);
        var y2 = offset + height - Math.round(y[i]*stepY);

        ctx.beginPath();
        ctx.moveTo(x1,y1);
        ctx.lineTo(x2,y2);
        ctx.stroke();

        ctx.fillText(x[i-1], x1-5, height + offset*1.5);

        ctx.strokeStyle = '#000000';
        ctx.lineWidth=0.5;
        ctx.beginPath();
        ctx.moveTo(x1, offset);
        ctx.lineTo(x1, offset + height);
        ctx.stroke();
        if (i == x.length-1) {

            ctx.beginPath();
            ctx.moveTo(x2, offset);
            ctx.lineTo(x2, offset + height);
            ctx.stroke();
            ctx.fillText(x[i], x2-5, height + offset*1.5);
        }
    }

}