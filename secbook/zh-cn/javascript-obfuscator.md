## QuickStart

install
```
npm install --save-dev javascript-obfuscator
```
or
```
yarn add --dev javascript-obfuscator
```

feature:
- 变量重命名
- 字符串提取和加密
- 随机添加无用代码进行混淆
- 控制流扁平化
- 各种代码转换

```
{
    compact: true, //紧凑，去除不必要的空格和换行
    controlFlowFlattening: false, //启用控制流平坦化，增加代码逻辑分析的难度
    controlFlowFlatteningThreshold: 0.75, //控制流平坦化的阈值，决定何时应用此技术
    deadCodeInjection: false, //控制流平坦化的阈值，决定何时应用此技术
    deadCodeInjectionThreshold: 0.4, //死代码注入的阈值，决定注入多少死代码。
    debugProtection: false, //启用调试保护，防止在控制台中打印信息或进行调试。
    debugProtectionInterval: 0,//调试保护的时间间隔（毫秒），用于控制保护的频率。
    disableConsoleOutput: false, //禁用控制台输出，防止通过控制台输出敏感信息。
    domainLock: [], //指定一个域名列表，如果脚本不在这些域名下运行，则阻止执行。
    domainLockRedirectUrl: 'about:blank', //当脚本在非指定域名下运行时，重定向到的URL。
    forceTransformStrings: [], //指定哪些字符串必须被转换，以增加混淆度。
    identifierNamesCache: null,  //用于缓存标识符名称，以便在多次混淆中保持一致。
    identifierNamesGenerator: 'hexadecimal', //指定生成标识符名称的方法。
    identifiersDictionary: [],
    identifiersPrefix: '',  //为所有生成的标识符名称添加前缀。
    ignoreImports: false,
    inputFileName: '',   //输入文件的名称，用于生成source map时指定文件名。
    log: false,  //是否记录混淆过程中的日志。
    numbersToExpressions: false,  //将数字转换为表达式，增加混淆度。
    optionsPreset: 'default',  //预设的混淆选项集合，可以快速应用一组配置。
    renameGlobals: false,  //重命名全局变量。
    renameProperties: false,  //重命名对象的属性。
    renamePropertiesMode: 'safe',  //重命名属性的模式，确保不会破坏代码功能。
    reservedNames: [],  //在重命名过程中保留的名称列表，不会被更改。
    reservedStrings: [],  //在混淆过程中保留的字符串列表，不会被转换。
    seed: 0,  //用于随机数生成的种子，确保每次混淆的结果一致。
    selfDefending: false,  //使混淆后的代码自我防御，检测并阻止尝试反混淆的行为。
    simplify: true,  //简化代码，移除无用的部分。
    sourceMap: false,  //是否生成source map文件，以便调试混淆后的代码。
    sourceMapBaseUrl: '',  //source map文件的基础URL。
    sourceMapFileName: '', //source map文件的名称。
    sourceMapMode: 'separate',  //source map的生成模式。
    sourceMapSourcesMode: 'sources-content',  //source map中源文件的表示方式。
    splitStrings: false,  //将长字符串分割成多个短字符串，并通过数组和函数调用组合起来。
    splitStringsChunkLength: 10,  //分割字符串时每个块的长度。
    stringArray: true,  //将字符串存储在数组中，并通过索引访问。
    stringArrayCallsTransform: true,  //对字符串数组访问的调用进行转换，增加混淆度。
    stringArrayCallsTransformThreshold: 0.5,  //字符串数组调用转换的阈值。
    stringArrayEncoding: [],
    stringArrayIndexesType: [
        'hexadecimal-number'
    ],//字符串数组索引的类型（如'hexadecimal-number'）。
    stringArrayIndexShift: true,
    stringArrayRotate: true,
    stringArrayShuffle: true,
    stringArrayWrappersCount: 1,
    stringArrayWrappersChainedCalls: true, //是否允许字符串数组包装函数进行链式调用。
    stringArrayWrappersParametersMaxCount: 2, //包装函数参数的最大数量。
    stringArrayWrappersType: 'variable', //包装函数的类型。
    stringArrayThreshold: 0.75,  //字符串数组转换的阈值。
    target: 'browser',  //混淆的目标环境。[browser, browser-no-eval, node]
    transformObjectKeys: false,  //转换对象键，以增加混淆度。
    unicodeEscapeSequence: false  //将字符串转换为Unicode转义序列。
}
```

## References

- [github javascript-obfuscator](https://github.com/javascript-obfuscator/javascript-obfuscator)
- [online version](obfuscator.io)