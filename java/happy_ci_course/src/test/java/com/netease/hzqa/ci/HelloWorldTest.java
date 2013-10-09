package com.netease.hzqa.ci;

import org.testng.Assert;
import org.testng.annotations.Test;

public class HelloWorldTest {

    @Test
    public void testEcho() {
        HelloWorld demo = new HelloWorld();
        String input = "你大爷李白白";
        Assert.assertEquals(demo.echo(input), input);
    }
}
