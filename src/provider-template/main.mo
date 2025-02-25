import Principal "mo:base/Principal";
import Types "./Types";
import Utils "./Utils";

shared({ caller = initializer }) actor class TestProvider() {
  public shared func verify(
      walletId: Principal,
      params: ?[{key: Text; value: Text}]
  ) : async Types.VerificationResult {
      // Test implementation
      let _validateParams = Utils.validateParams(params, ["collection"]);
      if (not _validateParams) {
          return {
              isValid = false;
              score = 0;
              message = "Missing required params: collection";
              walletId = walletId;
          };
      };
      // Simple logic check NFT
      let hasNFT = true;
      {
          isValid = hasNFT;
          score = if (hasNFT) 100 else 0;
          message = if (hasNFT) "Has NFT in collection" else "No NFT found";
          walletId;
      }
  };
  public func metadata() : async Types.ProviderMetadata {
      {
          name = "NFT Holdings Checker";
          description = "Verify NFT holdings on specific collection";
          version = "1.0.0";
          author = initializer;
          parameters = [
              {
                  name = "collection";
                  description = "NFT collection principal";
                  required = true;
                  paramType = #Principal;
              }
          ];
      }
  };
};