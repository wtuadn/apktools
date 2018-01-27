package com.wtuadn.apktools;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            Thread.sleep(2000);
        } catch (Exception ignore) {
        }
        setContentView(R.layout.activity_main);
        TextView tv_channel = findViewById(R.id.tv_channel);
        tv_channel.setText("Channel: " + ChannelUtils.getChannel(this));
    }
}
