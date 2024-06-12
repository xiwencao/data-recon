package handler

import (
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/render"
	"github.com/tendant/simple-user/user"
)

type Handler struct {
	UserService *user.UserService
}

func (h *Handler) Routes(r *chi.Mux) {
	r.Get("/hello", func(w http.ResponseWriter, r *http.Request) {
		render.PlainText(w, r, http.StatusText(http.StatusOK))
	})
	r.Get("/api/datarecon", h.handleDataRecon)
}

func (h *Handler) handleDataRecon(w http.ResponseWriter, r *http.Request) {
	return nil
}
