package duckdb

import (
	"github.com/xiwencao/data-recon/duckdb/db"

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
