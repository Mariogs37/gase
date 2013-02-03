require_relative 'stock_exchange'
require_relative 'account'
require_relative 'stock'
require_relative 'portfolio'

$gase = StockExchange.new

$gase.accounts['Phil'] = Account.new('Phil', 500_000)
$gase.accounts['Bob'] = Account.new('Bob', 250_000)
$gase.accounts['Jane'] = Account.new('Jane', 1_000_000)
$gase.accounts['Carol'] = Account.new('Carol', 250_000)

$gase.accounts['Bob'].portfolios['Tech'] = Portfolio.new('Tech')
$gase.accounts['Bob'].portfolios['Bank'] = Portfolio.new('Bank')
$gase.accounts['Bob'].portfolios['Energy'] = Portfolio.new('Energy')

$gase.accounts['Bob'].portfolios['Tech'].stocks['AAPL'] = Stock.new('AAPL')
$gase.accounts['Bob'].portfolios['Tech'].stocks['AMZN'] = Stock.new('AMZN')
$gase.accounts['Bob'].portfolios['Tech'].stocks['GOOG'] = Stock.new('GOOG')
$gase.accounts['Bob'].portfolios['Bank'].stocks['TD'] = Stock.new('TD')
$gase.accounts['Bob'].portfolios['Bank'].stocks['BAC'] = Stock.new('BAC')
$gase.accounts['Bob'].portfolios['Bank'].stocks['USB'] = Stock.new('USB')
$gase.accounts['Bob'].portfolios['Energy'].stocks['GE'] = Stock.new('GE')
$gase.accounts['Bob'].portfolios['Energy'].stocks['SWI'] = Stock.new('SWI')
$gase.accounts['Bob'].portfolios['Energy'].stocks['YGE'] = Stock.new('YGE')