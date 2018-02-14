package com.example.etudiant.td02;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.ArrayList;

public class RecipeEdit extends AppCompatActivity {
    RecyclerView ui_recycler_ingredients;
    RecipeEdit my_this;
    ingredient_adapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recipe_edit);
        ui_recycler_ingredients = findViewById(R.id.recycler_ingredients);
        ui_recycler_ingredients.setLayoutManager(new LinearLayoutManager(this));
        int val = getIntent().getIntExtra("somekey", 432);
//        scoreView = findViewById(R.id.score);
//        scoreView.setText("fdsfds "+val);
        adapter = new ingredient_adapter();
        ui_recycler_ingredients.setAdapter(adapter);
        my_this = this;

    }
    public void add_new_ingredient(View view)
    {
        adapter.add_ingredient();
    }

    class ingredient_adapter extends RecyclerView.Adapter<ingredient_adapter.recette_holder> {
        ArrayList<String> ingredients = new ArrayList<>();

        public void add_ingredient() {
            ingredients.add("");
            notifyItemInserted(ingredients.size() - 1);
        }

        void removeRow(int index) {
            ingredients.remove(index);
            notifyItemRemoved(index);
        }

        @Override
        public recette_holder onCreateViewHolder(ViewGroup parent, int viewType) {
            View cell = LayoutInflater.from(parent.getContext()).inflate(R.layout.ingredient_cell, parent, false);
            recette_holder holder = new recette_holder(cell);
//            recettes = new ArrayList<>();
            return holder;
        }

        @Override
        public void onBindViewHolder(recette_holder holder, int position) {
//            if (ingredients.get(position).equals(""))
//                holder.ui_titlelabel.setText("<no name, please edit>");
//            else
//                holder.ui_titlelabel.setText(ingredients.get(position));
//            holder.ui_categorylabel.setText("");
        }

        @Override
        public int getItemCount() {
            return ingredients.size();
        }

        class recette_holder extends RecyclerView.ViewHolder
                implements View.OnClickListener, EditText.OnFocusChangeListener
        {
//            private final TextView ui_titlelabel, ui_categorylabel;
            private final EditText ui_ingredient;
//            ingredient_adapter creator;

            public recette_holder(View itemView) {
                super(itemView);
                ui_ingredient = itemView.findViewById(R.id.ingredient);
//                ui_titlelabel = itemView.findViewById(R.id.recettetitre);
//                ui_categorylabel = itemView.findViewById(R.id.recettecat);

                Button delButton = itemView.findViewById(R.id.button_delete_ingredient);
                delButton.setOnClickListener(this);
//                Button editButton = itemView.findViewById(R.id.editButton);
//                editButton.setOnClickListener(this);
                ui_ingredient.setOnFocusChangeListener(this);
            }

            @Override
            public void onClick(View view) {
                removeRow(getAdapterPosition());
            }

            @Override
            public void onFocusChange(View view, boolean hasFocus) {
                if (hasFocus == false)
                {
//                    ingredients.set(getAdapterPosition(), ((EditText)view).getText().toString());
                    Log.d("what", ""+getAdapterPosition());
                }
            }
        }
    }



}
