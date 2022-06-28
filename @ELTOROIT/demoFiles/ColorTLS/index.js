function bin2Dec(bin) {
    let out = parseInt(bin, 2).toString(10);
    out = out % 256;
    return out;
}
function dec2Bin(dec) {
    let out = (dec >>> 0).toString(2);
    out = out.padStart(8, "0");
    out = out.slice(out.length - 8);
    return out;
}
function printDec(value) {
    let b = dec2Bin(value);
    let d = bin2Dec(b);
    console.log(`${b} => ${d}`);
}
function hexToRgb(color) {
    let output = { r: 0, b: 0, g: 0 };
    if (color[0] === "#") {
        output = {
            r: '0x' + color[1] + color[2] | 0,
            g: '0x' + color[3] + color[4] | 0,
            b: '0x' + color[5] + color[6] | 0
        }
    } else if (color.startsWith("rgb")) {
        // Remove spaces (inside the string)
        color = color.split("");
        color = color.filter(char => char !== " ");
        color = color.join("");
        // Get only the values
        color = color.substring(color.indexOf("(") + 1, color.indexOf(")"));
        color = color.split(",");
        output = {
            r: color[0],
            g: color[1],
            b: color[2],
        }
    } else {
        alert(`Can't understand color: ${color}`)
    }

    return output;
}
function rgbToHex(rgb) {
    let out = '000000'.split("");
    let tmp;
    tmp = rgb.r.toString(16).padStart(2, "0").split("");
    out[0] = tmp[0];
    out[1] = tmp[1];
    tmp = rgb.g.toString(16).padStart(2, "0").split("");
    out[2] = tmp[0];
    out[3] = tmp[1];
    tmp = rgb.b.toString(16).padStart(2, "0").split("");
    out[4] = tmp[0];
    out[5] = tmp[1];
    out = `#${out.join("")}`;
    return out;
}
function complement(colorIn) {
    let colorOut = hexToRgb(colorIn);
    colorOut.r = bin2Dec(dec2Bin(~colorOut.r));
    colorOut.g = bin2Dec(dec2Bin(~colorOut.g));
    colorOut.b = bin2Dec(dec2Bin(~colorOut.b));
    colorOut = rgbToHex(colorOut);
    return colorOut;
}
function addColors(color1, color2) {
    let colorOut = {};
    color1 = hexToRgb(color1);
    color2 = hexToRgb(color2);
    colorOut.r = bin2Dec(dec2Bin(color1.r + color2.r));
    colorOut.g = bin2Dec(dec2Bin(color1.g + color2.g));
    colorOut.b = bin2Dec(dec2Bin(color1.b + color2.b));
    colorOut = rgbToHex(colorOut);
    return colorOut;
}