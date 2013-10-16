/**
 * 游戏规则及答案见
 * http://projecteuler.net/problem=8
 */
public class EulerProblem8 {

    /**
     * 子字符串长度
     */
    public static final int DIGIT_NUM = 5;

    /**
     * 比较字符串大小
     * 返回较大者
     */
    public static String compareTwoString(String a, String b) {
        if (convertString(a) > convertString(b)) {
            return a;
        } else {
            return b;
        }
    }

    /**
     * 转换字符串，规则示例
     * "12345" = 1 x 2 x 3 x 4 x 5 = 120
     */
    public static long convertString(String numbers) {
        String[] chars = numbers.split("");
        long total = 1;
        for (int i = 1; i < chars.length; i++)     {
            total = total * Integer.parseInt(chars[i]);
        }
        return total;
    }

    /**
     * 求最大子字符串
     */
    public static long findMaxNum(String numbers) {
        String max = "1";
        for (int i = 0; i < numbers.length() - DIGIT_NUM + 1; i++)     {
            max = compareTwoString(max, numbers.substring(i, i + DIGIT_NUM));
        }
        return convertString(max);
    }
}
