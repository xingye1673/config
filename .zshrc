# pure皮肤
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# 插件
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.zsh/sudo/sudo.plugin.zsh
#source ~/.zsh/incr-0.2.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

# 匹配历史记录绑定上下方向键
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Java 环境
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home
export JDK_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home
export MAVEN_HOME=~/dev/apache-maven-3.6.3
export PATH=$PATH:$MAVEN_HOME/bin

#Node 环境
export NODE_HOME=~/dev/node-v12.18.0-darwin-x64
export PATH=$PATH:$NODE_HOME/bin

# Golang 环境
export GOROOT=$HOME/dev/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin

#HomeBrew 默认不自动升级
export HOMEBREW_NO_AUTO_UPDATE=true

#HomeBrew 清华大学
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

#别名
alias vi=nvim

#zsh vi-mode
set -o vi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
