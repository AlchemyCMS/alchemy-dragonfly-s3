## v4.0.4

- Include necessary files in gem package

## v4.0.3

- Add second task to generate EssencePicture thumbails
- Always show original image as zoomed image
- Do not enable image cropper if file is missing
- Show missing image for urls returning nil
- Do not convert JPEG images into JPG

## v4.0.2

- Add support for file attachments stored on S3
- Ensure the thumbnail uid has the rendered format
- Do not create a unique index on uid column

## v4.0.1

- Ensure to create new thumbs on in memory picture
- Add task to generate mssing thumbnails
- Use persisted filename instead of remote file name

## v4.0.0

- Alchemy 4 support
