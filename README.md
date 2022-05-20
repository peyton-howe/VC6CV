# VC6CV
VideoCore VI Computer Vision framework using OpenGL

This repository aims to make low-level stereoscopic CV on the Raspberry Pi 4 more accessible by providing examples and a slim framework to build on. It only covers real-time camera frame processing using OpenGL shaders (barrel shader) and text annotation over serual (bluetooth otw).

### For whom is this?
This is only really a good choice if you need better performance than what OpenCV offers you, at all costs. If you don't have space, power or cost 

### Why OpenGL?
OpenGL is easy to implement and, given examples, relatively painless. However, your framerate is pretty much capped at 60fps and processing capabilities are limited. Your processing time is measured in tens of milliseconds when dealing with high resolutions (1640x1232) for any shader that is a bit more complex. <br>

### Examples?
There are some clean examples on how to use both the GL and QPU way. Look into Commands.txt for example commands to invoke these examples.
#### GL
1. GLCV (main_gl): Simple program executing only a simple shader blitting the camera frame to the screen. Supports the YUV color space and scales the frame to fit the screen.
