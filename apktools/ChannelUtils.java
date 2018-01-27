package com.wtuadn.apktools.utils;

import android.content.Context;
import android.text.TextUtils;

import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 * Created by wtuadn on 2018/1/26.
 */

public class ChannelUtils {
    private static String channel;

    public static String getChannel(Context context) {
        if (TextUtils.isEmpty(channel)) {
            try {
                BufferedReader bf = new BufferedReader(new InputStreamReader(context.getAssets().open("channel")));
                channel = bf.readLine();
                bf.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return channel;
    }
}
