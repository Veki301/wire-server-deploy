FROM nixos/nix

COPY . /wire-server-deploy

RUN apk add -u bash git

RUN nix-env -f /wire-server-deploy/default.nix -iA pkgs.cachix

RUN cachix use wire-server-deploy

RUN nix-env -f /wire-server-deploy/default.nix -iA env

RUN rm -rf /wire-server-deploy
