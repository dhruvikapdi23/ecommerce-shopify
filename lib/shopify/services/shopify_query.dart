class ShopifyQuery {
  static String createCustomer = '''
    mutation customerCreate(\$input: CustomerCreateInput!) {
      customerCreate(input: \$input) {
        userErrors {
          field
          message
        }
        customer {
          id
          email
          firstName
        }
      }
    }
  ''';

  static String createCustomerToken = '''
    mutation customerAccessTokenCreate(\$input: CustomerAccessTokenCreateInput!) {
    customerAccessTokenCreate(input: \$input) {
      userErrors {
        field
        message
      }
      customerAccessToken {
        accessToken
        expiresAt
      }
    }
  }
  ''';

  static String getCustomerInfo = '''
    query(\$accessToken: String!) {
      customer(customerAccessToken: \$accessToken) {
        id
        email
        createdAt
        displayName
        phone
        firstName
        lastName
        defaultAddress {
          address1
          address2
          city
          firstName
          id
          lastName
          zip
          phone
          name
          latitude
          longitude
          province
          country
          countryCode
        }
        addresses(first: 10) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            node {
              address1
              address2
              city
              firstName
              id
              lastName
              zip
              phone
              name
              latitude
              longitude
              province
              country
              countryCode
            }
          }
        }
      }
    }
  ''';

  static String resetPassword = '''
    mutation customerRecover(\$email: String!) {
    customerRecover(email: \$email) {
      customerUserErrors {
        code
        field
        message
      }
    }
}
  ''';

  static String readCollections = '''
    query(\$cursor: String) {
       collections(first: 250, after: \$cursor) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            cursor
            node {
              id
              title
              description
              image() {
                id
                src
              }
            }
          }
        }
      }
    ''';

  static String getProductById = '''
   query (\$id: String) {
  products(first: 1, query: \$id) {
    edges {
      node {
        id
        title
        vendor
        description
        descriptionHtml
        totalInventory
        availableForSale
        productType
        onlineStoreUrl
        collections(first: 1) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            node {
              id
            }
          }
        }
        options {
          id
          name
          values
        }
        variants(first: 250) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            node {
              id
              title
              availableForSale
              quantityAvailable
              selectedOptions {
                name
                value
              }
              image() {
                src
              }
              price
              compareAtPrice
              priceV2 {
                amount
                currencyCode
              }
              compareAtPriceV2 {
                amount
                currencyCode
              }
            }
          }
        }
        images(first: 250) {
          edges {
            node {
              src
            }
          }
        }
      }
    }
  }
}
''';

  static String getProductByPrivateId = '''
   query(\$id: ID!) {
    node(id: \$id) {
    ...on Product {
      id
      title
      vendor
      description
      descriptionHtml
      availableForSale
      productType
      onlineStoreUrl
      collections(first: 1) {
        pageInfo {
          hasNextPage
          hasPreviousPage
        }
        edges {
          node {
            id
          }
        }
      }
      options {
        id
        name
        values
      }
      variants(first: 250) {
        pageInfo {
          hasNextPage
          hasPreviousPage
        }
        edges {
          node {
            id
            title
            availableForSale
            selectedOptions {
              name
              value
            }
            image() {
              src
            }
            price
            compareAtPrice
            priceV2 {
              amount
              currencyCode
            }
            compareAtPriceV2 {
              amount
              currencyCode
            }
          }
        }
      }
      images(first: 250) {
        pageInfo {
          hasNextPage
          hasPreviousPage
        }
        edges {
          node {
            src
          }
        }
      }
    }
  }
}
''';

  static String getProducts = '''
    query(\$cursor: String, \$pageSize: Int, \$query: String, \$reverse : Boolean, \$sortKey: ProductSortKeys, ) {
     products(first: \$pageSize, after: \$cursor, sortKey: \$sortKey, query: \$query, reverse: \$reverse) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
              cursor
              node {
                id
                title
                vendor
                description
                descriptionHtml
                totalInventory
                availableForSale
                productType
                onlineStoreUrl
                collections(first: 1) {
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                  edges {
                    node {
                      id
                    }
                  }
                }
                options {
                  id
                  name
                  values
                }
                variants(first: 250) {
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                  edges {
                    node {
                      id
                      title
                      availableForSale
                      quantityAvailable
                      selectedOptions {
                        name
                        value
                      }
                      image() {
                        src
                      }
                      priceV2 {
                        amount
                        currencyCode
                      }
                      compareAtPriceV2 {
                        amount
                        currencyCode
                      }
                    }
                  }
                }
                images(first: 250) {
                  edges {
                    node {
                      src
                    }
                  }
                }
              }
          }
      }
    }
  ''';

  static String getProductByCollection = '''
    query(\$categoryId: ID!, \$pageSize: Int, \$cursor: String) {
      node(id: \$categoryId) {
        id
        ... on Collection {
          title
          products(first: \$pageSize, after: \$cursor) {
            pageInfo {
              hasNextPage
              hasPreviousPage
            }
            edges {
              cursor
              node {
                id
                title
                vendor
                description
                descriptionHtml
                totalInventory
                availableForSale
                productType
                onlineStoreUrl
                collections(first: 1) {
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                  edges {
                    node {
                      id
                    }
                  }
                }
                options {
                  id
                  name
                  values
                }
                variants(first: 250) {
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                  edges {
                    node {
                      id
                      title
                      availableForSale
                      quantityAvailable
                      selectedOptions {
                        name
                        value
                      }
                      image() {
                        src
                      }
                      priceV2 {
                        amount
                        currencyCode
                      }
                      compareAtPriceV2 {
                        amount
                        currencyCode
                      }
                    }
                  }
                }
                images(first: 250) {
                  edges {
                    node {
                      src
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  ''';

  static String customerAddress = '''
    query(\$customerAccessToken: String!) {
      customer(customerAccessToken: \$customerAccessToken) {
        addresses(first: 10) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            node {
              address1
              address2
              city
              firstName
              id
              lastName
              zip
              phone
              name
              latitude
              longitude
              province
              country
              countryCode
            }
          }
        }
      }
    }
  ''';

  static String customerAddressCreate = '''
  mutation customerAddressCreate(\$address: MailingAddressInput!, \$customerAccessToken: String!) {
  customerAddressCreate(address: \$address, customerAccessToken: \$customerAccessToken) {
    customerAddress {
      address1
    }
    customerUserErrors {
      # CustomerUserError fields
    }
  }
}''';

  static String updateShippingAddress = '''
    mutation checkoutShippingAddressUpdateV2(
    \$shippingAddress: MailingAddressInput!
    \$checkoutId: ID!) {
      checkoutShippingAddressUpdateV2(shippingAddress: \$shippingAddress, checkoutId: \$checkoutId) {
        userErrors {
          field
          message
        }
        checkout {
          ...checkoutInformation
        }
      }
    }
    $fragmentCheckout
  ''';

  static String createCheckout = '''
    mutation checkoutCreate(
      \$input: CheckoutCreateInput! 
      \$langCode: LanguageCode
      \$countryCode: CountryCode
    ) @inContext(language: \$langCode, country: \$countryCode) {
        checkoutCreate(input: \$input) {
          checkout {
            ...checkoutPriceInformation
          }
          checkoutUserErrors {
            code
            field
            message
          }
        }
    }
    $fragmentCheckoutPrice
  ''';

  static String updateCheckout = '''
    mutation checkoutLineItemsReplace(
      \$lineItems: [CheckoutLineItemInput!]!
      \$checkoutId: ID!
      \$langCode: LanguageCode
    ) @inContext(language: \$langCode) {
      checkoutLineItemsReplace(lineItems: \$lineItems, checkoutId: \$checkoutId) {
        userErrors {
          field
          message
        }
        checkout {
          ...checkoutPriceInformation
        }
      }
    }
    $fragmentCheckoutPrice
  ''';

  static String getOrder = '''
    query(\$cursor: String, \$pageSize: Int, \$customerAccessToken: String!) {
      customer(customerAccessToken: \$customerAccessToken) {
        orders(first: \$pageSize, after: \$cursor, reverse: true) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            cursor
            node {
              id
              financialStatus
              processedAt
              orderNumber
              totalPriceV2{
                amount
              }
              statusUrl
              totalTaxV2 {
                amount
              }
              subtotalPriceV2 {
                amount
              }
              shippingAddress {
                address1
                address2
                city
                company
                country
                firstName
                id
                lastName
                zip
                provinceCode
                phone
                province
                name
                longitude
                latitude
                lastName
              }
              lineItems(first: \$pageSize) {
                pageInfo {
                  hasNextPage
                  hasPreviousPage
                }
                edges {
                  node {
                    quantity
                    title
                    originalTotalPrice{
                      amount
                    }
                    variant {
                      title
                      image() {
                        src
                      }
                      price
                      selectedOptions {
                        name
                        value
                      }
                      product {
                        id
                        title
                        description
                        availableForSale
                        productType
                        onlineStoreUrl
                        options {
                          id
                          name
                          values
                        }
                        variants(first: 250) {
                          pageInfo {
                            hasNextPage
                            hasPreviousPage
                          }
                          edges {
                            node {
                              id
                              title
                              availableForSale
                              selectedOptions {
                                name
                                value
                              }
                              image() {
                                src
                              }
                              price
                              compareAtPrice
                            }
                          }
                        }
                        images(first: 250) {
                          pageInfo {
                            hasNextPage
                            hasPreviousPage
                          }
                          edges {
                            node {
                              src
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  ''';

  static String getOrderById(id) => '''
    query {
    node(id: "gid://shopify/Order/$id") {
    id
    ... on Order {
      id
      title
      vendor
      description
      descriptionHtml
      totalInventory
      availableForSale
      productType
      onlineStoreUrl
                collections(first: 1) {
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                  edges {
                    node {
                      id
                    }
                  }
                }
                options {
                  id
                  name
                  values
                }
                variants(first: 250) {
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                  edges {
                    node {
                      id
                      title
                      availableForSale
                      quantityAvailable
                      selectedOptions {
                        name
                        value
                      }
                      image() {
                        src
                      }
                      priceV2 {
                        amount
                        currencyCode
                      }
                      compareAtPriceV2 {
                        amount
                        currencyCode
                      }
                    }
                  }
                }
                images(first: 250) {
                  edges {
                    node {
                      src
                    }
                  }
                }
              
    }
  }
}
  ''';

  static String getProductByHandle = '''
   query (\$handle: String!) {
  productByHandle(handle: \$handle) {
    id
     title
     vendor
      description
      descriptionHtml
      totalInventory
      availableForSale
      productType
      onlineStoreUrl
      collections(first: 1) {
       edges {
        node {
          id
         }
      }
      }
   options {
       id
       name
      values
        }
        variants(first: 250) {
          pageInfo {
      hasNextPage
          hasPreviousPage
     }
           edges {
         node {
         id
                title
        availableForSale
              quantityAvailable
                   selectedOptions {
                   name
                       value
                    }
                      image() {
                     src
                      }
                      priceV2 {
                        amount
                        currencyCode
                      }
                      compareAtPriceV2 {
                        amount
                        currencyCode
                      }
                    }
                  }
                }
                images(first: 250) {
                  edges {
                    node {
                      src
                    }
      }
    }
  }
}
''';

  static const fragmentCheckoutPrice = '''
    fragment checkoutPriceInformation on Checkout {
      id
      webUrl
      taxesIncluded
      currencyCode
      email
      discountApplications(first: 10) {
        edges {
          node {
            __typename
            ... on DiscountCodeApplication {
              allocationMethod
              applicable
              code
              targetSelection
              targetType
              value {
                __typename
                ... on MoneyV2 {
                  amount
                }
                ... on PricingPercentageValue {
                  percentage
                }
              }
            }
          }
        }
      }
      subtotalPriceV2 {
        amount
        currencyCode
      }
      totalTaxV2 {
        amount
        currencyCode
      }
      totalPriceV2 {
        amount
        currencyCode
      }
      paymentDueV2 {
        amount
        currencyCode
      }
    } 
  ''';

/*
  static String applyCoupon = '''
    mutation checkoutDiscountCodeApplyV2(
    \$discountCode: String!
    \$checkoutId: ID!) {
      checkoutDiscountCodeApplyV2(discountCode: \$discountCode, checkoutId: \$checkoutId) {
          checkoutUserErrors {
            field
            message
          }
          checkout {
            ...checkoutPriceInformation
          }
      }
    }
    $fragmentCheckoutPrice
    ''';*/

  static String applyCoupon = '''
    mutation checkoutDiscountCodeApplyV2(
    \$discountCode: String!
    \$checkoutId: ID!) {
      checkoutDiscountCodeApplyV2(discountCode: \$discountCode, checkoutId: \$checkoutId) {
          checkoutUserErrors {
            field
            message
          }
          checkout {
            ...checkoutPriceInformation
          }
      }
    }
    $fragmentCheckoutPrice
    ''';

  static String removeCoupon = '''
    mutation checkoutDiscountCodeRemove(\$checkoutId: ID!) {
      checkoutDiscountCodeRemove(checkoutId: \$checkoutId) {
        checkoutUserErrors {
          code
          field
          message
        }
        checkout {
          ...checkoutPriceInformation
        }
      }
    }
    $fragmentCheckoutPrice
    ''';

  static String getCheckout = '''
    query(\$checkoutId: ID!) {
        node(id: \$checkoutId) {
            ... on Checkout {
                ...checkoutInformation
            }
        }
    } 
    $fragmentCheckout   
  ''';

  static const fragmentCheckout = '''
    fragment checkoutInformation on Checkout {
      ...checkoutPriceInformation
      availableShippingRates {
        ready
        shippingRates {
          handle
          priceV2 {
            amount
            currencyCode
          }
          title
        }
      }
      lineItems(first: 100) {
        nodes {
          id
          title
          quantity
          variant {
            priceV2 {
              amount
              currencyCode
            }
            image() {
              src
            }
          }
        }
      }
      shippingLine {
        priceV2 {
          amount
          currencyCode
        }
        title
        handle
      }
      shippingAddress {
        address1
        address2
        city
        firstName
        id
        lastName
        zip
        phone
        name
        latitude
        longitude
        province
        country
      }
    }
    $fragmentCheckoutPrice
''';

  static String checkoutLinkUser = '''
    mutation checkoutCustomerAssociateV2(\$checkoutId: ID!, \$customerAccessToken: String!) {
    checkoutCustomerAssociateV2(checkoutId: \$checkoutId, customerAccessToken: \$customerAccessToken) {
      checkoutUserErrors {
        code
        field
        message
      }
      customer {
        id
        email
      }
      checkout {
        ...checkoutPriceInformation
      }
    }
  }
  $fragmentCheckoutPrice
  ''';

  static String updateCheckoutAttribute = '''
    mutation checkoutAttributesUpdateV2(
    \$checkoutId: ID! 
    \$input: CheckoutAttributesUpdateV2Input!
    \$langCode: LanguageCode
    \$countryCode: CountryCode
    ) @inContext(language: \$langCode, country: \$countryCode) {
    checkoutAttributesUpdateV2(checkoutId: \$checkoutId, input: \$input) {
        checkout {
          id
        }
        checkoutUserErrors {
          code
          field
          message
        }
      }
    }
  ''';

  static String customerDelete = '''
    mutation customerDelete(\$id: ID!) {
      customerDelete(input: {id: \$id}) {
        shop {
          id
        }
        userErrors {
          field
          message
        }
        deletedCustomerId
      }
  }
  ''';
}
