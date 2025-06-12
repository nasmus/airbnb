import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["icon", "text"];

  async updateWishlistStatus(e) {
    e.preventDefault();

    const { userLoggedIn, status, propertyId, userId, wishlistId } = this.element.dataset;

    if (userLoggedIn === "false") {
      document.querySelector(".js-login").click();
      return;
    }

    try {
      if (status === "false") {
        await this.addToWishlist(propertyId, userId);
      } else {
        await this.removeFromWishlist(wishlistId);
      }
    } catch (error) {
      console.error("Wishlist update error:", error);
    }
  }

  async addToWishlist(propertyId, userId) {
    const response = await fetch("/api/wishlists", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ property_id: propertyId, user_id: userId }),
    });

    if (!response.ok) throw new Error("Failed to add to wishlist");

    const data = await response.json();
    this.updateUIAfterAdd(data.id);
  }

  async removeFromWishlist(wishlistId) {
    const response = await fetch(`/api/wishlists/${wishlistId}`, {
      method: "DELETE",
    });

    if (!response.ok) throw new Error("Failed to remove from wishlist");

    this.updateUIAfterRemove();
  }

  updateUIAfterAdd(wishlistId) {
    this.element.dataset.wishlistId = wishlistId;
    this.element.dataset.status = "true";
    this.iconTarget.classList.replace("fill-none", "fill-red-500");
    if (this.hasTextTarget) this.textTarget.innerText = "Saved";
  }

  updateUIAfterRemove() {
    this.element.dataset.wishlistId = "";
    this.element.dataset.status = "false";
    this.iconTarget.classList.replace("fill-red-500", "fill-none");
    if (this.hasTextTarget) this.textTarget.innerText = "Save";
  }
}
