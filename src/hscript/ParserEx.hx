package hscript;

class ParserEx extends Parser {
    public override function parseModule( content : String, ?origin : String = "hscript" ) {
        var decls = super.parseModule(content, origin);
        return decls;
    }
}