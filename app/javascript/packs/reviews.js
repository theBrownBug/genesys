const axios = require("axios");
let reviewReturned = {};
let orderNos = {};

$(document).ready(() => {
  if (!localStorage.liked_reviews) {
    localStorage.liked_reviews = JSON.stringify([]);
  } else {
    const likedReviews = JSON.parse(localStorage.liked_reviews);

    likedReviews.map((id) => $(`#like_${id}`).toggleClass("fas far"));
  }
});

likeClick = (review) => {
  const likeId = `#like_${review.id}`;
  const likeMessageId = `#like_message_${review.id}`;

  let reviewData;

  if ($(likeId).hasClass("fas")) {
    if (review.id in reviewReturned) {
      reviewData = getReviewData(reviewReturned[review.id], -1);
    } else {
      reviewData = getReviewData(review, -1);
    }
  } else {
    if (review.id in reviewReturned) {
      reviewData = getReviewData(reviewReturned[review.id], 1);
    } else {
      reviewData = getReviewData(review, 1);
    }
  }

  updateReview(likeId, likeMessageId, review.id, reviewData);
};

const getReviewData = (review, like_change) => {
  return {
    title: review.title,
    body: review.body,
    rating: review.rating,
    likes: review.likes + like_change,
    is_live: review.is_live,
    is_live_landing: review.is_live_landing,
  };
};

const storeLikedReviews = (reviewId) => {
  const likedReviews = JSON.parse(localStorage.liked_reviews);

  if (likedReviews.includes(reviewId)) {
    const index = likedReviews.indexOf(reviewId);

    likedReviews.splice(index, 1);
  } else {
    likedReviews.push(reviewId);
  }

  localStorage.liked_reviews = JSON.stringify(likedReviews);
};

const updateReview = (likeId, likeMessageId, id, reviewData) => {
  let config = {
    headers: {
      "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
    },
  };

  axios
    .patch(`/reviews/${id}`, { likes: reviewData.likes }, config)
    .then(({ data }) => {
      $(likeId).toggleClass("far fas");
      reviewReturned[id] = data;

      $(likeMessageId).text(`${data.likes} people found this review helpful`);

      storeLikedReviews(id);
    });
};

isLiveLandingChanged = (id) => {
  const orderNoId = `#order_no_${id}_div`;

  if ($(`#is_live_landing_${id}`).is(":checked")) {
    console.log("checked.");
    console.log(orderNos[id]);
    console.log(orderNoId);

    $(orderNoId).html(orderNos[id]);
  } else {
    if (!orderNos[id]) {
      orderNos[id] = $(orderNoId).html();
    }

    $(orderNoId).empty();
  }
};
