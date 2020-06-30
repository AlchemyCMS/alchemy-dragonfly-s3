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
