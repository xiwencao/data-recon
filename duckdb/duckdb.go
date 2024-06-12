package duckdb

import (
	"db"

	_ "github.com/marcboeker/go-duckdb"
)

type DuckdbService struct {
	queries *db.Queries
}

func New(queries *db.Queries) *DuckdbService {
	return &DuckdbService{
		queries: queries,
	}
}
