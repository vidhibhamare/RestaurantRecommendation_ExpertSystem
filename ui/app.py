import streamlit as st
from pyswip import Prolog

# Initialize Prolog instance
prolog = Prolog()

# Load the Prolog rules and facts
prolog.consult("C:/Users/Admin/OneDrive/Documents/Restaurant_Recommendation_ExpertSystem/RestaurantRecommendation_ExpertSystem/prolog/rules.pl")

# Streamlit UI
st.title("Restaurant Recommendation System")

# Collect user preferences via Streamlit form
with st.form("user_preferences"):
    cuisine = st.selectbox("Cuisine", ["indian", "american", "italian", "mexican", "chinese", "french", "continental", "japanese", "vegan", "fusion"])
    price = st.selectbox("Price Range", ["low", "medium", "high"])
    food_type = st.selectbox("Food Type", ["healthy", "junk"])
    distance = st.selectbox("Max Distance (km)", [1, 2, 3, 4, 5, 6])  # assuming distance in km
    rating = st.slider("Minimum Rating", 1.0, 5.0, 4.0)
    veg = st.radio("Vegetarian", ["yes", "no"])
    desserts = st.radio("Desserts", ["yes", "no", "any"])

    submit_button = st.form_submit_button("Get Recommendations")

if submit_button:
    # Prepare Prolog query
    query = f"recommend(Restaurant, {cuisine}, {price}, {food_type}, {distance}, {rating}, {veg}, {desserts})"

    # Get the results from Prolog
    results = list(prolog.query(query))

    if results:
        st.write("Recommended Restaurants:")
        for result in results:
            st.write(result["Restaurant"])
    else:
        st.write("No matching restaurants found.")
