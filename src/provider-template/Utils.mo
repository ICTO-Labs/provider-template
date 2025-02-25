import Types "./Types";
module{

    public func validateParams(params: ?[Types.ProviderParam], required: [Text]) : Bool {
        switch(params) {
            case null { required.size() == 0 };
            case (?p) {
                for (req in required.vals()) {
                    if (not hasParam(p, req)) return false;
                };
                true
            };
        };
    };

    public func hasParam(params: [Types.ProviderParam], key: Text) : Bool {
        for (p in params.vals()) {
            if (p.key == key) return true;
        };
        false;
    };
}