package com.example.etudiant.td02;

import android.Manifest;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import io.realm.Realm;

public class homeActivity extends AppCompatActivity {
    private EditText myEnterText;
    private TextView myRenderText;
//    private FusedLocationProviderClient mFusedLocationClient;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        myEnterText=findViewById(R.id.idEnterText);
        myRenderText=findViewById(R.id.idRenderText);
        String strText=loadPreferences();
        myRenderText.setText(strText);

        Realm.init(this);


    }
    public void buttonClicked(View button){
        String strText;
        strText=loadPreferences();
        strText+="\n";
        strText+=myEnterText.getText().toString();


        myRenderText.setText(strText);
        myEnterText.setText("");
        savePreferences(strText);
    }

    public String loadPreferences(){
        SharedPreferences preferences = getSharedPreferences("blocnote",MODE_PRIVATE);
        return preferences.getString("my_text","");
    }

    public void savePreferences(String str){
        SharedPreferences preferences =getSharedPreferences("blocnote",MODE_PRIVATE);
        SharedPreferences.Editor prefEditor= preferences.edit();
        prefEditor.putString("my_text",str);
        prefEditor.apply();
    }

    public void erasePreferences(View button){
        savePreferences("");
        myRenderText.setText("");
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.main_menu,menu);
        return super.onCreateOptionsMenu(menu);
    }


    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if(item.getItemId() == R.id.clear_item)
        {
            savePreferences("");
            myRenderText.setText("");
            Toast.makeText(this,"aha",Toast.LENGTH_LONG).show();
        }
        else if(item.getItemId() == R.id.sharebutton)
        {
            Intent shareintent = new Intent(Intent.ACTION_SEND);
            shareintent.setType("text/plain");
            shareintent.putExtra(Intent.EXTRA_TEXT, "A dada sur un bidet a roulettes");
            if(shareintent.resolveActivity(getPackageManager())!=null)
            {
                startActivity(shareintent);
            } else {
                Toast.makeText(this,"you hair is sexy like a marsupial on a tuesday bike",Toast.LENGTH_LONG).show();
            }
        }
        else if(item.getItemId() == R.id.settings_item)
        {
//            Intent activintent = new Intent(this, settings_activity.class);
            Intent activintent = new Intent(this, listetruc.class);
            activintent.putExtra("somekey", 12);
            startActivity(activintent);
        }
        return super.onOptionsItemSelected(item);
    }
}
