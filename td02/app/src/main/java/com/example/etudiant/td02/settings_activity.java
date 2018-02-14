package com.example.etudiant.td02;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class settings_activity extends AppCompatActivity {

    private TextView scoreView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings_activity);
        int val = getIntent().getIntExtra("somekey", 432);
        scoreView = findViewById(R.id.score);
        scoreView.setText("fdsfds "+val);
    }
}
