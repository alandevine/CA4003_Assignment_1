import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Lexer;

import java.io.IOException;

public class Parser {
    public static void main(String [] args) throws IOException {
        CharStream input = CharStreams.fromFileName(args[1]);
        Lexer lexer = new CALLexer(input);

        System.out.println(lexer);
    }
}