module.exports = grammar({
  name: 'paketref',

  rules: {
    source_file: $ => repeat($._statement),

    _statement: $ => choice(
      $.group,
      $.main_package,
      $.comment
    ),

    comment: $ => token(seq('//', /.*/)),

    main_package: $ => /[A-Za-z0-9\.\-_]+/,
    package: $ => /[A-Za-z0-9\.\-_]+/,

    group: $ => seq(
      'group',
      field('name', $.group_name),
      repeat(choice(
        $.group_comment,
        $.package
      ))
    ),

    group_name: $ => /[A-Za-z0-9\.\-_]+/,

    group_comment: $ => alias($.comment, $.group_comment),
  }
});
