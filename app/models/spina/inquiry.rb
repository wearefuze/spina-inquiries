# frozen_string_literal: true

module Spina
  class Inquiry < ActiveRecord::Base

    filters_spam(
      {
        message_field: :message,
        email_field: :email,
        author_field: :name,
        extra_spam_words:
          [
            # commerce
            'as seen on',
            'buy',

            # personal
            'meet singles',

            # employment
            'additional income',
            'be your own boss',
            'double your',
            'earn cash',
            'earn $',
            'earn per week',
            'expect to earn',
            'extra income',
            'make money',
            'make $',
            'money making',
            'online biz',
            'potential earnings',
            'while you sleep',

            # financial
            '$$$',
            'big bucks',
            'cashcashcash',
            'f r e e',
            'free cash',
            'for just $xxx',
            'hidden assets',
            'only $',
            'save $',
            'save big money',
            'serious cash',

            # financial business
            'credit card offers',
            'explode your business',
            'full refund',
            'investment decision',
            'investment oppurtunity',
            'no investment',
            'no credit check',
            'no hidden costs',
            'stock alert',

            # financial personal
            'consolidate your debt',
            'elimiate bad credit',
            'eliminate debt',
            'financially independent',
            'get out of debt',
            'get paid',
            'social security number',
            'your income',

            # general
            'password',
            'wife',
            'teen',
            'miracle',
            'order now',
            'while supplies last',
            'take action now',
            'once in a lifetime',
            'limited time',
            'information you requested',
            'do it today',
            'call now',
            'fantasic deal',
            'for free',
            'risk free',
            'satisfaction guranteed',

            # marketing
            'click below',
            'click here',
            'direct email',
            'direct marketing',
            'email harvest',
            'email marketing',
            'increase sales',
            'increase your sales',
            'increase traffic',
            'month trial offer',
            'more internet traffic',
            'not spam',
            'opt in',
            'search engine',
            'visit our website',
            'we hate spam',
            'website traffic',

            # medical
            'lose weight',
            'weight loss',
            'remove wrinkles',
            'stop snoring',

            # numbers
            '50% off',
            '100% off',
            'join millions',

            # offers
            'financial freedom',
            'have you been turned down?',
            'important information regarding',
            'message contains',
            'no age restrictions',
            'no catch',
            'no purchase necesarry',
            'no questions asked',
            'no strings attached',
            'vacation offer',
            'prize',
            'winner',
            'you have been selected',

            # calls to action
            'see for yourself',
            'sign up today',

            # free
            'free consultation',
            'free hosting',
            'free installation',
            'free gift',
            'free investment',
            'free leads',
            'free membership',
            'free money',
            'free trial',
            'free sample',
          ],
      }
    )

    validates :name, :email, :message, presence: true
    validates :email, spam_email: true
    validates :email, format: URI::MailTo::EMAIL_REGEXP

    scope :read, -> { where(read: true) }
    scope :unread, -> { where(read: false) }
    scope :spam, -> { where(spam: true) }
    scope :valid, -> { where(spam: false) }

    def unread?
      !read
    end

    def not_spam?
      !spam
    end

    def is_new?
      7.days.ago <= created_at
    end

    def sent_at
      created_at.strftime("%e %B %Y")
    end
  end
end
