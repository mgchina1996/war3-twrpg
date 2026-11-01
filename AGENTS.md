# 项目说明

## 数据位置与工作范围

- 当前地图数据位于仓库根目录的 `data/`，修改前先确认目标文件和对象。
- 保持改动最小，只修改用户请求相关的对象和字段，不格式化整个数据文件，不调整无关内容。
- 本文只描述当前仓库已导出数据的维护规则，不是完整的 w3x 反编译规范。

## JASS 脚本

`data/war3map.j` 是地图 JASS 脚本，适合修改：

- 游戏逻辑、触发器和伤害公式。
- 英雄、技能、物品的脚本效果。
- 运行时创建单位、添加技能、设置属性等逻辑。

## 对象编辑器覆盖数据

`data/table/` 保存对象编辑器导出的 OBJ 覆盖数据。只有需要修改对象编辑器覆盖字段时才编辑此目录。

| 文件 | 内容 | 通常对应的地图文件 |
| --- | --- | --- |
| `ability.ini` | 技能 | `war3map.w3a` |
| `buff.ini` | 魔法效果 | `war3map.w3h` |
| `upgrade.ini` | 科技 | `war3map.w3q` |
| `item.ini` | 物品 | `war3map.w3t` |
| `unit.ini` | 单位 | `war3map.w3u` |
| `w3i.ini` | 地图信息 | `war3map.w3i` |

## INI 修改规则

对象通常以四字符 ID 分段：

```ini
[hcas]
_parent = "hcas"
```

修改时遵守：

- 只修改目标对象段中的目标字段。
- 不删除段标题。
- 不删除或改动 `_parent`，除非用户明确要求。
- 数字不加引号，字符串使用双引号。
- 路径中的反斜杠保持 `\\`。
- 不格式化整个文件，不调整无关对象或字段顺序。

示例：

```ini
[hcas]
_parent = "hcas"
def = 500
file = "Models\\Hero.mdl"
```

## 地图资源

新增或替换模型、贴图等资源时，资源文件放在 `data/resources/` 内，通过 `data/resources/manifest.json` 声明写入地图 MPQ 后的内部路径。

示例目录：

```text
data/resources/
├─ manifest.json
└─ files/
   ├─ Hero.mdx
   └─ Textures/
      └─ Hero.blp
```

清单示例：

```json
{
  "version": 1,
  "files": [
    {
      "source": "files/Hero.mdx",
      "target": "Models\\Hero.mdx",
      "mode": "add"
    },
    {
      "source": "files/Textures/Hero.blp",
      "target": "Textures\\Hero.blp",
      "mode": "replace"
    }
  ]
}
```

- `source`：相对于 `data/resources/` 的本地文件路径。
- `target`：地图 MPQ 内部的资源路径；JSON 中反斜杠写作 `\\`。
- `mode: "add"`：要求目标资源原本不存在。
- `mode: "replace"`：可替换已有资源，也可在不存在时新增。
- 不通过资源清单修改 `war3map.j`、`war3map.w3i`、物编文件、`war3map.wts` 或 MPQ 内部表文件。

## 受保护的工具文件

`data/.w3x-object-studio.json` 是 `w3x-object-studio` 的增量回写和校验文件。

不要修改、格式化、删除或重建该文件，除非用户明确要求并说明原因。

## 工作方式

- 优先使用 `rg` 搜索对象 ID、中文名、英文名、技能码或字段名。
- 保持改动最小，只编辑用户请求相关对象。
- 不要把本说明理解为完整 w3x 反编译规范；这里描述的是当前仓库导出的这部分数据的维护规则。
