package com.example.androide_demo;

import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;

public class MainActivity extends AppCompatActivity {
    private int count = 0;
    public static final String EXTRA_MESSAGE = "com.example.androide_demo.MESSAGE";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button buttonInc = (Button)findViewById(R.id.click);
        Button buttonClear = (Button)findViewById(R.id.clear);
        final TextView text = (TextView)findViewById(R.id.text);
        text.setText("fuck you count: 0");

        buttonInc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                count += 1;
                text.setText("fuck you count: " + String.valueOf(count));
            }
        });

        buttonClear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                count = 0;
                text.setText("count: 0");
            }
        });

    }


}