%Text recognition and creating the mask

image = imread('test.jpg');
ocrResults = ocr(image)
recognizedText = ocrResults.Text;
figure;
imshow(image);
text(600, 150, recognizedText, 'BackgroundColor', [1 1 1]);