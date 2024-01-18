# Arguments that can be used outside of a Makes project
# and therefore are agnostic to the framework.
{
  stateDirs ? {
    global = "$HOME_IMPURE/.cache/makes/state";
    project = "$HOME_IMPURE/.cache/makes/state/__default__";
  },
  system ? builtins.currentSystem,
}: let
  fix' = __unfix__: let x = __unfix__ x // {inherit __unfix__;}; in x;
  sources = import ../nix/sources.nix;
  args = fix' (self: let
    __nixpkgs__ = import sources.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    inherit __nixpkgs__;
    __nixpkgsSrc__ = sources.nixpkgs;
    __shellCommands__ = ./shell-commands/template.sh;
    __shellOptions__ = ./shell-options/template.sh;
    __stateDirs__ = stateDirs;
    __system__ = system;
    __toModuleOutputs__ = import ./to-module-outputs/default.nix self;
    asContent = import ./as-content/default.nix;
    attrsGet = import ./attrs-get/default.nix;
    attrsMapToList = __nixpkgs__.lib.mapAttrsToList;
    attrsMerge = builtins.foldl' __nixpkgs__.lib.recursiveUpdate {};
    attrsOptional = __nixpkgs__.lib.optionalAttrs;
    calculateCvss3 = import ./calculate-cvss-3/default.nix self;
    calculateScorecard = import ./calculate-scorecard/default.nix self;
    chunks = import ./chunks/default.nix self;
    computeOnAwsBatch = import ./compute-on-aws-batch/default.nix self;
    deployContainerImage = import ./deploy-container-image/default.nix self;
    deployNomad = import ./deploy-nomad/default.nix self;
    deployTerraform = import ./deploy-terraform/default.nix self;
    inherit (__nixpkgs__.lib.strings) escapeShellArg;
    inherit (__nixpkgs__.lib.strings) escapeShellArgs;
    inherit (__nixpkgs__.lib) fakeSha256;
    fetchArchive = import ./fetch-archive/default.nix self;
    fetchGithub = import ./fetch-github/default.nix self;
    fetchGitlab = import ./fetch-gitlab/default.nix self;
    fetchNixpkgs = import ./fetch-nixpkgs/default.nix self;
    fetchRubyGem = import ./fetch-rubygem/default.nix self;
    fetchUrl = import ./fetch-url/default.nix self;
    inherit (__nixpkgs__.lib) filterAttrs;
    inherit (__nixpkgs__.lib.lists) flatten;
    formatBash = import ./format-bash/default.nix self;
    formatNix = import ./format-nix/default.nix self;
    formatPython = import ./format-python/default.nix self;
    formatTerraform = import ./format-terraform/default.nix self;
    formatYaml = import ./format-yaml/default.nix self;
    fromJson = builtins.fromJSON;
    fromJsonFile = path: builtins.fromJSON (builtins.readFile path);
    fromToml = builtins.fromTOML;
    fromYaml = import ./from-yaml/default.nix self;
    fromYamlFile = path: self.fromYaml (builtins.readFile path);
    gitlabCi = import ./gitlab-ci/default.nix;
    inherit (__nixpkgs__.lib.strings) hasPrefix;
    inherit (__nixpkgs__.lib.strings) hasSuffix;
    inherit (__nixpkgs__.stdenv) isDarwin;
    inherit (__nixpkgs__.stdenv) isLinux;
    libGit = import ./lib-git/default.nix self;
    listOptional = __nixpkgs__.lib.lists.optional;
    lintClojure = import ./lint-clojure/default.nix self;
    lintGitCommitMsg = import ./lint-git-commit-msg/default.nix self;
    lintGitMailMap = import ./lint-git-mailmap/default.nix self;
    lintMarkdown = import ./lint-markdown/default.nix self;
    lintNix = import ./lint-nix/default.nix self;
    lintPython = import ./lint-python/default.nix self;
    lintPythonImports = import ./lint-python-imports/default.nix self;
    lintTerraform = import ./lint-terraform/default.nix self;
    lintWithAjv = import ./lint-with-ajv/default.nix self;
    lintWithLizard = import ./lint-with-lizard/default.nix self;
    inherit (__nixpkgs__.lib.filesystem) listFilesRecursive;
    makeContainerImage = import ./make-container-image/default.nix self;
    makeDerivation = import ./make-derivation/default.nix self;
    makeDerivationParallel = import ./make-derivation-parallel/default.nix self;
    makeDynamoDb = import ./make-dynamodb/default.nix self;
    makeEnvVars = import ./make-env-vars/default.nix self;
    makeEnvVarsForTerraform = import ./make-env-vars-for-terraform/default.nix self;
    makeNodeJsEnvironment = import ./make-node-js-environment/default.nix self;
    makeNodeJsModules = import ./make-node-js-modules/default.nix self;
    makeNomadEnvironment = import ./make-nomad-environment/default.nix self;
    makePythonEnvironment = import ./make-python-environment/default.nix self;
    makePythonPyprojectPackage = import ./make-python-pyproject-package/default.nix;
    makePythonVscodeSettings = import ./make-python-vscode-settings/default.nix self;
    makeRubyGemsEnvironment = import ./make-ruby-gems-environment/default.nix self;
    makeRubyGemsInstall = import ./make-ruby-gems-install/default.nix self;
    makeScript = import ./make-script/default.nix self;
    makeScriptParallel = import ./make-script-parallel/default.nix self;
    makeSearchPaths = import ./make-search-paths/default.nix self;
    makeSecretForAwsFromEnv = import ./make-secret-for-aws-from-env/default.nix self;
    makeSecretForAwsFromGitlab = import ./make-secret-for-aws-from-gitlab/default.nix self;
    makeSecretForEnvFromSops = import ./make-secret-for-env-from-sops/default.nix self;
    makeSecretForGpgFromEnv = import ./make-secret-for-gpg-from-env/default.nix self;
    makeSecretForKubernetesConfigFromAws = import ./make-secret-for-kubernetes-config-from-aws/default.nix self;
    makeSecretForNomadFromEnv = import ./make-secret-for-nomad-from-env/default.nix self;
    makeSecretForTerraformFromEnv = import ./make-secret-for-terraform-from-env/default.nix self;
    makeTerraformEnvironment = import ./make-terraform-environment/default.nix self;
    makeSslCertificate = import ./make-ssl-certificate/default.nix self;
    makeTemplate = import ./make-template/default.nix self;
    makeWorkspaceForTerraformFromEnv = import ./make-workspace-for-terraform-from-env/default.nix self;
    managePorts = import ./manage-ports/default.nix self;
    patchShebangs = import ./patch-shebangs/default.nix self;
    pythonOverrideUtils = import ./python-override-utils/default.nix;
    inherit (__nixpkgs__.lib) removePrefix;
    secureKubernetesWithRbacPolice = import ./secure-kubernetes-with-rbac-police/default.nix self;
    securePythonWithBandit = import ./secure-python-with-bandit/default.nix self;
    sortAscii = builtins.sort (a: b: a < b);
    sortAsciiCaseless = builtins.sort (a: b: __nixpkgs__.lib.toLower a < __nixpkgs__.lib.toLower b);
    stringCapitalize = import ./string-capitalize/default.nix self;
    sublist = import ./sublist/default.nix self;
    taintTerraform = import ./taint-terraform/default.nix self;
    testLicense = import ./test-license/default.nix self;
    testTerraform = import ./test-terraform/default.nix self;
    testPullRequest = import ./test-pull-request/default.nix self;
    testPython = import ./test-python/default.nix self;
    toDerivationName = __nixpkgs__.lib.strings.sanitizeDerivationName;
    toBashArray = import ./to-bash-array/default.nix self;
    toBashMap = import ./to-bash-map/default.nix self;
    toFileJson = import ./to-file-json/default.nix self;
    toFileToml = import ./to-file-toml/default.nix self;
    toFileYaml = import ./to-file-yaml/default.nix self;
    toFileJsonFromFileYaml = import ./to-file-json-from-file-yaml/default.nix self;
    toFileLst = import ./to-file-lst/default.nix;
  });
in
  assert args.isDarwin || args.isLinux; args
