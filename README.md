# jQuery Render Image

jQuery Render Image is a plugin that renders an image from a file input into a canvas.
If the element is not a canvas, it create and appends a canvas in it.

## Usage

The basic call is just:
	.renderImage(file [, width [, height [, onFinish]]])
Where the file is the File taken from the input[type=file], width can set the width and height are the dimensions of the canvas that will be created and the onFinish is the function called when the rendering is finished.

For more customization, you can can
	.renderImage({file: file [, width: number] [, height: number] [, onFinish: function]})

When no height and no width is passed, the canvas is created with the source image size.
When only height or width is passed, the canvas is created with that size and keeps the aspect ratio.
When both height and width is passed, the canvas is created with that exactly size and cropping occurs from the top-right corner.

## Example
Drawing the image on a existing canvas:
	$("input[type=file]").change(function() {
	  $("canvas").renderImage(this.files[0]);
	})

Creating a canvas inside another selector:
	$("input[type=file]").change(function() {
	  $("div").renderImage(this.files[0]);
	})

## License
Copyright (c) 2013 Bernardo Amorim (http://github.com/bamorim)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
