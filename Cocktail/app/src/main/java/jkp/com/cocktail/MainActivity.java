package jkp.com.cocktail;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ListView;
import android.widget.Toast;


public class MainActivity extends AppCompatActivity {

    ListView listRecipies;

    // TODO : Remplacer si possible le tableau de String[] par un tableau de type ArrayList
    // TODO : Créer un fichier R_cocktails.csv contenant une liste de noms de cocktail
    // TODO : Lire le fichier CSV et charger la liste des noms dans un tableau de type ArrayList
    // TODO : remplacer la liste des prénoms par une liste de recettes de cocktail
    private String[] Recipies = new String[]{
            "Antoine", "Benoit", "Cyril", "David", "Eloise", "Florent",
            "Gerard", "Hugo", "Ingrid", "Jonathan", "Kevin", "Logan",
            "Mathieu", "Noemie", "Olivia", "Philippe", "Quentin", "Romain",
            "Sophie", "Tristan", "Ulric", "Vincent", "Willy", "Xavier",
            "Yann", "Zoé"
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

//        listRecipies = (ListView) findViewById(R.id.lstVRecipe);
//
//        //android.R.layout.simple_list_item_1 est une vue disponible de base dans le SDK android,
//        //Contenant une TextView avec comme identifiant "@android:id/text1"
//
//        final ArrayAdapter<String> adapter = new ArrayAdapter<String>(MainActivity.this,
//                android.R.layout.simple_list_item_1, Recipies);
//        listRecipies.setAdapter(adapter);
    }

    public void addRecipe (){
        // TODO : Gérer l'ajout d'un élément dans la liste du tableau
    }

    public void button_touched(View button){
//        Toast.makeText(this, String.valueOf(button.getId())+"3221222", Toast.LENGTH_SHORT);
        Intent activintent = new Intent(this, activity_recette.class);
//        activintent.putExtra("somekey", 12);
        startActivity(activintent);
    }


}



//
