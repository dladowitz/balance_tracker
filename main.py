import os
import mintapi

print "Welcome to the Balance Tracker App"

print "Logging in to Mint.com"
mint = mintapi.Mint(os.environ['MINT_EMAIL'], os.environ['MINT_PASSWORD'])

print "Getting account balances"
accounts = mint.get_accounts()

number_of_accounts = len(accounts)

print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
print("%(number_of_accounts)s accounts_found" % locals())
print ""
print "Accounts:"
print ""
for account in accounts:
    mintId = account['id']
    accountName = account['accountName']
    vendorName = account['fiLoginDisplayName']
    balance = account['currentBalance']
    type = account['accountType']
    print ""
    print "-----------------------------------"
    print("Account Name: %(accountName)s" % locals())
    print("Venndor Name: %(vendorName)s" % locals())
    print("Balance: %(balance)s" % locals())
    print("Type: %(type)s" % locals())
    print("Mint ID: %(mintId)s" % locals())
    print "-----------------------------------"

print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# account format
# {
#   'closeDateInDate': datetime.datetime(2017, 2, 14, 22, 12, 40),
#   'lastUpdatedInDate': datetime.datetime(2017, 2, 14, 22, 12, 40),
#   u'isTerminal': True,
#   u'currency': u'USD',
#   u'interestRate': None,
#   u'isAccountNotFound': False,
#   u'dueAmt': 0,
#   u'addAccountDate': 1480816261000,
#   u'isHostAccount': False,
#   u'dueDate': u'03/08/2017',
#   u'accountId': xxxxxxxx,
#   u'linkedAccountId': None,
#   u'possibleLinkAccounts': [],
#   u'fiLoginStatus': u'OK',
#   u'exclusionType': u'0',
#   u'id': xxxxxxx,
#   'addAccountDateInDate': datetime.datetime(2016, 12, 3, 17, 51, 1),
#   u'yodleeAccountNumberLast4': u'xxxx',
#   u'fiLastUpdated': 1487139160000,
#   u'accountName': u'BankAmericard Rewards World MasterCard Card',
#   u'ccAggrStatus': 0,
#   u'lastUpdatedInString': u'14 minutes',
#   u'fiLoginDisplayName': u'Bank of America',
#   u'yodleeAccountId': xxxxxxx,
#   u'linkedAccount': None,
#   u'status': u'1',
#   u'fiLoginId': xxxxxx,
#   u'userName': None,
#   u'lastUpdated': 1487139160000,
#   u'isClosed': False,
#   u'value': -800,
#   u'accountType': u'credit',
#   u'isAccountClosedByMint': False,
#   u'fiLoginUIStatus': u'OK',
#   u'linkStatus': u'NOT_LINKED',
#   u'isError': False,
#   u'isActive': True,
#   u'linkCreationTime': None,
#   u'name': u'BankAmericard Rewards World MasterCard Card',
#   u'accountTypeInt': 3,
#   u'yodleeName': u'BankAmericard Rewards World MasterCard Card',
#   u'fiName': u'Bank of America',
#   u'usageType': None,
#   u'accountStatus': u'1',
#   u'isHiddenFromPlanningTrends': True,
#   u'accountSystemStatus': u'ACTIVE',
#   u'klass': u'credit',
#   u'currentBalance': 800,
#   u'closeDate': 1487139160000, '
#   fiLastUpdatedInDate': datetime.datetime(2017, 2, 14, 22, 12, 40)
#   }