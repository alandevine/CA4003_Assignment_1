import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.CharStreams;

import java.io.InputStream;
import java.io.FileInputStream;
import java.io.IOException;

public class cal {
    public static void main(String [] args) throws IOException {
        String inputFile = null;

        if (args.length > 0)
            inputFile = args[0];

        InputStream is;

        if (inputFile != null) {
            is = new FileInputStream(inputFile);

            try {
                CALLexer lexer = new CALLexer(CharStreams.fromStream(is));
                // remove all Error Listeners
                lexer.removeErrorListeners();
                lexer.addErrorListener(new CALSyntaxListener());
                CommonTokenStream tokens = new CommonTokenStream(lexer);
                CALParser parser = new CALParser(tokens);
                // remove all Error Listeners
                parser.removeErrorListeners();
                parser.addErrorListener(new CALSyntaxListener());
                parser.prog();
                System.out.println(inputFile + " parsed successfully");
            } catch (Exception e) {
                System.out.println(inputFile + " has not parsed");
            }
        }
    }
}
