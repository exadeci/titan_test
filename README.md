# Titan OS — Media Catalog API


## Run

```bash
docker compose up -d db
bundle install
bin/rails db:prepare db:seed
bin/rails server
```

Optional: `DATABASE_URL=postgres://postgres:postgres@localhost:5432/titan_os_development`

## API

```
GET /lists/:list_id/contents?page=1&limit=20&content_type=movie
```

- `content_type`: `movie`, `tv_show`, `season`, `episode` (optional; blank ignored)
- Returns `contents` in list order with `position`, plus Pagy metadata in `pagy`
- Page past the end returns an empty `contents` array

Example after seeding:

```bash
curl http://localhost:3000/lists/1/contents
```

## Tests

```bash
bundle exec rspec
```

## Assumptions
- Lists have a name
- Lists position manual
- Deleting a TvShow cascades to its seasons; deleting a Season cascades to its episodes. Deleting content removes it from lists.
- Response includes parent ids, not parent titles.
