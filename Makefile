# コンパイラとオプション
CC = gcc
CFLAGS = -Wall -Wextra -g -Isrc

# ディレクトリと実行ファイル名
SRCDIR = src
BUILDDIR = build
TARGET = $(BUILDDIR)/output

# 自動でソースファイルとオブジェクトファイルを設定
SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(SOURCES))

# .PHONYターゲット
.PHONY: all clean

# デフォルトルール: 実行ファイルを作成
all: $(TARGET)

# リンク: オブジェクトファイルから実行ファイルを作成
$(TARGET): $(OBJECTS)
	@mkdir -p $(BUILDDIR)
	$(CC) $(OBJECTS) -o $@

# コンパイル: .cファイルから.oファイルを作成
$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# クリーンアップ
clean:
	rm -rf $(BUILDDIR)

