## v3.6.6

- Do not convert JPG images into JPEG
- Prevent db race conditions while creating thumbs

## v3.6.5

- Include necessary files in gem package

## v3.6.4

- Add second task to generate EssencePicture thumbails
- Always show original image as zoomed image
- Do not enable image cropper if file is missing
- Show missing image for urls returning nil
- Do not convert JPEG images into JPG

## v3.6.3

- Add support for file attachments stored on S3
- Ensure the thumbnail uid has the rendered format
- Do not create a unique index on uid column

## v3.6.2

- Ensure to create new thumbs on in memory picture
- Add task to generate mssing thumbnails
- Use persisted filename instead of remote file name

## v3.6.1

- Fix picture_thumbs migration for Rails 4.2
- Fix picture_monkey_patch loading
